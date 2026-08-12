import 'package:go_router/go_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/orders/domain/params/order_details_params.dart';
import 'package:nextcart/features/orders/presentation/views/order_details_view.dart';
import 'package:nextcart/features/orders/presentation/views/orders_view.dart';

class OrdersRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.orders,
      builder: (context, state) => const OrdersView(),
    ),
    GoRoute(
      path: RoutePaths.orderDetails,
      builder: (context, state) {
        final params = state.extra as OrderDetailsParams;
        return OrderDetailsView(params: params);
      },
    ),
  ];
}
