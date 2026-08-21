// deno-lint-ignore-file no-explicit-any
import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@13.11.0?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const STRIPE_SECRET_KEY = Deno.env.get("STRIPE_SECRET_KEY")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

const SHIPPING_RATE_CENTS = 500;
const FREE_SHIPPING_THRESHOLD_CENTS = 5000;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function errorResponse(message: string, status = 400): Response {
  return jsonResponse({ error: message }, status);
}

serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return errorResponse("Method not allowed", 405);
  }

  try {
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return errorResponse("Missing Authorization header", 401);
    }

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
      auth: { persistSession: false },
    });

    const { data: { user }, error: authError } = await supabase.auth.getUser(
      authHeader.replace("Bearer ", ""),
    );

    if (authError || !user) {
      return errorResponse("Unauthorized", 401);
    }

    const userId = user.id;

    let body: { currency?: string } = {};
    try {
      body = await req.json();
    } catch {
      // No body is fine
    }
    const currency = (body.currency ?? "usd").toLowerCase();

    // Fetch cart from DB - server is the source of truth
    const { data: cartRows, error: cartError } = await supabase
      .from("cart")
      .select("quantity, products(id, title, thumbnail, price)")
      .eq("user_id", userId);

    if (cartError) {
      console.error("Cart fetch error:", cartError);
      return errorResponse("Failed to retrieve cart", 500);
    }

    if (!cartRows || cartRows.length === 0) {
      return errorResponse("Cart is empty", 400);
    }

    // Recalculate totals server-side
    let subtotalCents = 0;
    const lineItems: Array<{
      productId: string;
      productName: string;
      productImage: string;
      unitPriceCents: number;
      quantity: number;
      subtotalCents: number;
    }> = [];

    for (const row of cartRows) {
      const product = row.products as any;
      if (!product) {
        return errorResponse("Cart contains invalid product reference", 400);
      }
      const unitPriceCents = Math.round(parseFloat(product.price.toString()) * 100);
      const qty = row.quantity as number;
      const itemSubtotalCents = unitPriceCents * qty;
      subtotalCents += itemSubtotalCents;
      lineItems.push({
        productId: product.id,
        productName: product.title,
        productImage: product.thumbnail,
        unitPriceCents,
        quantity: qty,
        subtotalCents: itemSubtotalCents,
      });
    }

    const shippingCents = subtotalCents >= FREE_SHIPPING_THRESHOLD_CENTS ? 0 : SHIPPING_RATE_CENTS;
    const taxCents = 0;
    const totalCents = subtotalCents + shippingCents + taxCents;

    const stripe = new Stripe(STRIPE_SECRET_KEY, { apiVersion: "2023-10-16" });

    // Find or create Stripe Customer
    let stripeCustomerId: string;
    const { data: customerRow } = await supabase
      .from("stripe_customers")
      .select("stripe_customer_id")
      .eq("user_id", userId)
      .maybeSingle();

    if (customerRow?.stripe_customer_id) {
      stripeCustomerId = customerRow.stripe_customer_id;
    } else {
      const { data: profile } = await supabase
        .from("profiles")
        .select("email, full_name")
        .eq("id", userId)
        .maybeSingle();

      const stripeCustomer = await stripe.customers.create({
        email: profile?.email ?? user.email ?? undefined,
        name: profile?.full_name ?? undefined,
        metadata: { supabase_user_id: userId },
      });
      stripeCustomerId = stripeCustomer.id;

      await supabase.from("stripe_customers").insert({
        user_id: userId,
        stripe_customer_id: stripeCustomerId,
      });
    }

    // Idempotency: check for an existing pending_payment order with same amount
    const { data: existingOrder } = await supabase
      .from("orders")
      .select("id, stripe_payment_intent_id, total_amount")
      .eq("user_id", userId)
      .eq("status", "pending_payment")
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    if (
      existingOrder?.stripe_payment_intent_id &&
      parseFloat(existingOrder.total_amount.toString()) * 100 === totalCents
    ) {
      const existingPi = await stripe.paymentIntents.retrieve(
        existingOrder.stripe_payment_intent_id,
      );
      if (
        existingPi.status === "requires_payment_method" ||
        existingPi.status === "requires_confirmation" ||
        existingPi.status === "requires_action"
      ) {
        return jsonResponse({
          client_secret: existingPi.client_secret,
          payment_intent_id: existingPi.id,
          order_id: existingOrder.id,
          amount: totalCents,
          currency,
          subtotal: subtotalCents / 100,
          shipping: shippingCents / 100,
          tax: taxCents / 100,
          total: totalCents / 100,
        });
      }
    }

    // Create Stripe PaymentIntent
    const idempotencyKey = `order_${userId}_${Date.now()}`;
    const paymentIntent = await stripe.paymentIntents.create(
      {
        amount: totalCents,
        currency,
        customer: stripeCustomerId,
        setup_future_usage: "off_session",
        automatic_payment_methods: { enabled: true },
        metadata: { supabase_user_id: userId },
      },
      { idempotencyKey },
    );

    // Create order in DB
    const { data: orderRow, error: orderError } = await supabase
      .from("orders")
      .insert({
        user_id: userId,
        status: "pending_payment",
        subtotal_amount: subtotalCents / 100,
        shipping_amount: shippingCents / 100,
        tax_amount: taxCents / 100,
        total_amount: totalCents / 100,
        currency,
        stripe_payment_intent_id: paymentIntent.id,
      })
      .select("id")
      .single();

    if (orderError || !orderRow) {
      console.error("Order creation error:", orderError);
      await stripe.paymentIntents.cancel(paymentIntent.id).catch(console.error);
      return errorResponse("Failed to create order", 500);
    }

    const orderId = orderRow.id;

    // Create order_items (snapshots)
    const orderItemsPayload = lineItems.map((item) => ({
      order_id: orderId,
      product_id: item.productId,
      product_name: item.productName,
      product_image: item.productImage,
      unit_price: item.unitPriceCents / 100,
      quantity: item.quantity,
      subtotal: item.subtotalCents / 100,
    }));

    const { error: itemsError } = await supabase
      .from("order_items")
      .insert(orderItemsPayload);

    if (itemsError) {
      console.error("Order items creation error:", itemsError);
      await supabase.from("orders").delete().eq("id", orderId);
      await stripe.paymentIntents.cancel(paymentIntent.id).catch(console.error);
      return errorResponse("Failed to create order items", 500);
    }

    return jsonResponse({
      client_secret: paymentIntent.client_secret,
      payment_intent_id: paymentIntent.id,
      order_id: orderId,
      amount: totalCents,
      currency,
      subtotal: subtotalCents / 100,
      shipping: shippingCents / 100,
      tax: taxCents / 100,
      total: totalCents / 100,
    });
  } catch (error: any) {
    console.error("Unhandled error in create-payment-intent:", error);
    return errorResponse("Internal server error", 500);
  }
});
