import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/brand_products/domain/params/brand_products_routing_params.dart';
import '../../features/category_products/domain/params/category_products_routing_params.dart';

import '../../features/otp/domain/entities/otp_reason.dart';
import '../../features/orders/domain/params/order_details_params.dart';
import '../../features/profile/domain/entities/user_profile_entity.dart';
import 'routes_paths.dart';

abstract class RoutingHelper {
  // ── Auth / OTP ────────────────────────────────────────────────────────────

  static void pushOtp(BuildContext context, {required OtpReason otpReason}) {
    context.push(RoutePaths.otp, extra: otpReason);
  }

  // ── Profile ───────────────────────────────────────────────────────────────

  static Future<T?> pushEditProfile<T>(
    BuildContext context, {
    required UserProfileEntity userProfile,
  }) {
    return context.push<T>(RoutePaths.editProfile, extra: userProfile);
  }

  static void pushThemeSelection(BuildContext context) {
    context.push(RoutePaths.themeSelection);
  }

  // ── Products / Discovery ──────────────────────────────────────────────────

  static void pushSearch(BuildContext context) {
    context.push(RoutePaths.search);
  }

  static void pushProducts(BuildContext context, {String title = 'Products'}) {
    context.push(RoutePaths.products, extra: {'title': title});
  }

  static void pushBrands(BuildContext context) {
    context.push(RoutePaths.brands);
  }

  static void pushCategories(BuildContext context) {
    context.push(RoutePaths.categories);
  }

  static void pushCategoryProducts(
    BuildContext context, {
    required CategoryProductsRoutingParams params,
  }) {
    context.push(RoutePaths.categoryProducts, extra: params.toJson());
  }

  static void pushBrandProducts(
    BuildContext context, {
    required BrandProductsRoutingParams params,
  }) {
    context.push(RoutePaths.brandProducts, extra: params.toJson());
  }

  static void pushProductDetails(BuildContext context, {required String productId}) {
    context.push(RoutePaths.productDetails, extra: productId);
  }

  // ── Cart ──────────────────────────────────────────────────────────────────

  /// Switch to the Cart tab inside the StatefulShellRoute.
  /// Use [go] (not push) so the bottom-nav tab index is properly updated.
  static void goCart(BuildContext context) {
    context.go(RoutePaths.cart);
  }

  // ── Orders / Checkout ─────────────────────────────────────────────────────

  static void pushOrders(BuildContext context) {
    context.push(RoutePaths.orders);
  }

  static void pushOrderDetails(
    BuildContext context, {
    required String orderId,
    bool fromCheckout = false,
  }) {
    context.push(
      RoutePaths.orderDetails,
      extra: OrderDetailsParams(orderId: orderId, fromCheckout: fromCheckout),
    );
  }

  static void pushCheckout(BuildContext context) {
    context.push(RoutePaths.checkout);
  }
}
