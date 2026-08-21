import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/brand_products/domain/params/brand_products_routing_params.dart';
import '../../features/category_products/domain/params/category_products_routing_params.dart';
import '../../features/products/domain/params/products_routing_params.dart';
import '../../core/params/product_params.dart';

import '../../features/orders/domain/params/order_details_params.dart';
import '../../features/profile/domain/entities/user_profile_entity.dart';
import 'routes_paths.dart';

abstract class RoutingHelper {

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

  static void pushProducts(BuildContext context, {
    required String title,
    ProductParams? params,
  }) {
    context.push(RoutePaths.products, extra: ProductsRoutingParams(title: title, params: params ?? const ProductParams()).toJson());
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
