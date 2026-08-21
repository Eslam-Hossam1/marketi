// deno-lint-ignore-file no-explicit-any
import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@13.11.0?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const STRIPE_SECRET_KEY = Deno.env.get("STRIPE_SECRET_KEY")!;
const STRIPE_WEBHOOK_SECRET = Deno.env.get("STRIPE_WEBHOOK_SECRET")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json" },
  });
}

serve(async (req: Request) => {
  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const stripe = new Stripe(STRIPE_SECRET_KEY, { apiVersion: "2023-10-16" });
  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // ── 1. Verify Stripe signature ─────────────────────────────────────────────
  const signature = req.headers.get("stripe-signature");
  if (!signature) {
    return jsonResponse({ error: "Missing stripe-signature header" }, 400);
  }

  const body = await req.text();
  let event: Stripe.Event;

  try {
    event = await stripe.webhooks.constructEventAsync(
      body,
      signature,
      STRIPE_WEBHOOK_SECRET,
    );
  } catch (err: any) {
    console.error("Webhook signature verification failed:", err.message);
    return jsonResponse({ error: "Invalid signature" }, 400);
  }

  // ── 2. Idempotency: skip if already processed ──────────────────────────────
  const { data: existingPayment } = await supabase
    .from("payments")
    .select("id")
    .eq("stripe_event_id", event.id)
    .maybeSingle();

  if (existingPayment) {
    // Already processed — return 200 to prevent Stripe retries
    return jsonResponse({ received: true, status: "already_processed" });
  }

  // ── 3. Route by event type ─────────────────────────────────────────────────
  try {
    switch (event.type) {
      case "payment_intent.succeeded": {
        await handlePaymentIntentSucceeded(
          supabase,
          event.id,
          event.data.object as Stripe.PaymentIntent,
        );
        break;
      }
      case "payment_intent.payment_failed": {
        await handlePaymentIntentFailed(
          supabase,
          event.id,
          event.data.object as Stripe.PaymentIntent,
        );
        break;
      }
      case "payment_intent.canceled": {
        await handlePaymentIntentCanceled(
          supabase,
          event.id,
          event.data.object as Stripe.PaymentIntent,
        );
        break;
      }
      case "charge.refunded": {
        await handleChargeRefunded(
          supabase,
          event.id,
          event.data.object as Stripe.Charge,
        );
        break;
      }
      default:
        // Unhandled event type — return 200 to prevent retry
        console.log(`Unhandled event type: ${event.type}`);
    }
  } catch (err: any) {
    console.error(`Error processing event ${event.type}:`, err);
    // Return 500 so Stripe retries this event
    return jsonResponse({ error: "Processing failed" }, 500);
  }

  return jsonResponse({ received: true });
});

// ── Event Handlers ─────────────────────────────────────────────────────────────

async function handlePaymentIntentSucceeded(
  supabase: any,
  eventId: string,
  pi: Stripe.PaymentIntent,
): Promise<void> {
  const { data: order } = await supabase
    .from("orders")
    .select("id, user_id, total_amount, currency")
    .eq("stripe_payment_intent_id", pi.id)
    .maybeSingle();

  if (!order) {
    console.error(`No order found for payment_intent: ${pi.id}`);
    return;
  }

  // Update order status to paid
  await supabase
    .from("orders")
    .update({ status: "paid" })
    .eq("id", order.id);

  // Record payment
  await supabase.from("payments").insert({
    order_id: order.id,
    user_id: order.user_id,
    stripe_payment_intent_id: pi.id,
    stripe_charge_id: pi.latest_charge as string | null,
    amount: order.total_amount,
    currency: order.currency,
    status: "succeeded",
    stripe_event_id: eventId,
    metadata: { payment_method: pi.payment_method },
  });

  // Clear the user's cart after successful payment
  await supabase
    .from("cart")
    .delete()
    .eq("user_id", order.user_id);

  console.log(`Order ${order.id} paid successfully.`);
}

async function handlePaymentIntentFailed(
  supabase: any,
  eventId: string,
  pi: Stripe.PaymentIntent,
): Promise<void> {
  const { data: order } = await supabase
    .from("orders")
    .select("id, user_id, total_amount, currency")
    .eq("stripe_payment_intent_id", pi.id)
    .maybeSingle();

  if (!order) {
    console.error(`No order found for payment_intent: ${pi.id}`);
    return;
  }

  const failureReason =
    pi.last_payment_error?.message ?? "Payment failed";

  // Keep as pending_payment so user can retry
  await supabase
    .from("orders")
    .update({ status: "pending_payment" })
    .eq("id", order.id);

  // Record failed payment attempt
  await supabase.from("payments").insert({
    order_id: order.id,
    user_id: order.user_id,
    stripe_payment_intent_id: pi.id,
    amount: order.total_amount,
    currency: order.currency,
    status: "failed",
    stripe_event_id: eventId,
    failure_reason: failureReason,
  });

  console.log(`Payment failed for order ${order.id}: ${failureReason}`);
}

async function handlePaymentIntentCanceled(
  supabase: any,
  eventId: string,
  pi: Stripe.PaymentIntent,
): Promise<void> {
  const { data: order } = await supabase
    .from("orders")
    .select("id, user_id, total_amount, currency")
    .eq("stripe_payment_intent_id", pi.id)
    .maybeSingle();

  if (!order) {
    console.error(`No order found for payment_intent: ${pi.id}`);
    return;
  }

  await supabase
    .from("orders")
    .update({ status: "cancelled" })
    .eq("id", order.id);

  await supabase.from("payments").insert({
    order_id: order.id,
    user_id: order.user_id,
    stripe_payment_intent_id: pi.id,
    amount: order.total_amount,
    currency: order.currency,
    status: "cancelled",
    stripe_event_id: eventId,
  });

  console.log(`Order ${order.id} cancelled.`);
}

async function handleChargeRefunded(
  supabase: any,
  eventId: string,
  charge: Stripe.Charge,
): Promise<void> {
  const piId = typeof charge.payment_intent === "string"
    ? charge.payment_intent
    : charge.payment_intent?.id;

  if (!piId) {
    console.error("Charge refunded event missing payment_intent");
    return;
  }

  const { data: order } = await supabase
    .from("orders")
    .select("id, user_id, total_amount, currency")
    .eq("stripe_payment_intent_id", piId)
    .maybeSingle();

  if (!order) {
    console.error(`No order found for charge refund, payment_intent: ${piId}`);
    return;
  }

  const refundAmount = charge.amount_refunded / 100;

  await supabase
    .from("orders")
    .update({ status: "refunded" })
    .eq("id", order.id);

  await supabase.from("payments").insert({
    order_id: order.id,
    user_id: order.user_id,
    stripe_payment_intent_id: piId,
    stripe_charge_id: charge.id,
    amount: order.total_amount,
    currency: order.currency,
    status: "refunded",
    stripe_event_id: eventId,
    refund_amount: refundAmount,
  });

  console.log(`Order ${order.id} refunded (amount: ${refundAmount}).`);
}
