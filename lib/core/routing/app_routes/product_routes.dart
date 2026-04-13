import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/products/presentation/views/products_view.dart';
import 'package:marketi/features/brands/presentation/views/brands_view.dart';
import 'package:marketi/features/categories/presentation/views/categories_view.dart';
import 'package:marketi/features/search/presentation/views/search_view.dart';
import 'package:marketi/features/product_details/presentation/views/product_details_view.dart';
import 'package:marketi/features/product_details/domain/params/product_details_params.dart';

class ProductRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.products,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return ProductsView(title: extra?['title'] ?? 'Products');
      },
    ),
    GoRoute(
      path: RoutePaths.brands,
      builder: (context, state) => const BrandsView(),
    ),
    GoRoute(
      path: RoutePaths.categories,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: RoutePaths.productDetails,
      builder: (context, state) {
        final params = ProductDetailsRoutingParams(productId: 1);
        return ProductDetailsView(productId: params.productId);
      },
    ),
  ];
}
