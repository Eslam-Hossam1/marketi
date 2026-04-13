import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/brand_products/domain/params/brand_products_routing_params.dart';
import 'package:marketi/features/brand_products/presentation/views/brand_products_view.dart';

class BrandProductsRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.brandProducts,
      builder: (context, state) {
        final params = BrandProductsRoutingParams.fromJson(
          state.extra as Map<String, dynamic>,
        );
        return BrandProductsView(
          title: params.title,
          brand: params.brand,
        );
      },
    ),
  ];
}
