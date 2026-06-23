import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/orders/presentation/views/orders_view.dart';

class OrdersRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.orders,
      builder: (context, state) => const OrdersView(),
    ),
  ];
}
