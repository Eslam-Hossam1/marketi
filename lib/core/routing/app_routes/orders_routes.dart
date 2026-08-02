import 'package:go_router/go_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
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
        final orderId = state.extra as String;
        return OrderDetailsView(orderId: orderId);
      },
    ),
  ];
}
