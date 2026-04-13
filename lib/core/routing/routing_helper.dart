import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/brand_products/domain/params/brand_products_routing_params.dart';
import '../../features/category_products/domain/params/category_products_routing_params.dart';
import '../../features/product_details/domain/params/product_details_params.dart';
import '../../features/otp/domain/entities/otp_reason.dart';
import '../../features/profile/domain/entities/user_profile_entity.dart';
import 'routes_paths.dart';

abstract class RoutingHelper {
  static void pushOtp(BuildContext context, {required OtpReason otpReason}) {
    context.push(RoutePaths.otp, extra: otpReason);
  }

  static Future<T?> pushEditProfile<T>(
    BuildContext context, {
    required UserProfileEntity userProfile,
  }) {
    return context.push<T>(RoutePaths.editProfile, extra: userProfile);
  }

  static void pushThemeSelection(BuildContext context) {
    context.push(RoutePaths.themeSelection);
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

  static void pushProducts(BuildContext context, {String title = 'Products'}) {
    context.push(RoutePaths.products, extra: {'title': title});
  }

  static void pushProductDetails(
    BuildContext context, {
    required ProductDetailsRoutingParams params,
  }) {
    context.push(RoutePaths.productDetails, extra: params.toJson());
  }
}
