import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/category_products/domain/params/category_products_routing_params.dart';
import 'package:marketi/features/category_products/presentation/views/category_products_view.dart';

class CategoryProductsRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.categoryProducts,
      builder: (context, state) {
        final params = CategoryProductsRoutingParams.fromJson(
          state.extra as Map<String, dynamic>,
        );
        return CategoryProductsView(
          title: params.title,
          categorySlug: params.categorySlug,
        );
      },
    ),
  ];
}
