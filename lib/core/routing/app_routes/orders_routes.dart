import 'package:go_router/go_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/checkout/domain/entities/checkout_entity.dart';
import 'package:nextcart/features/checkout/presentation/views/checkout_view.dart';
import 'package:nextcart/features/checkout/presentation/views/payment_delay_view.dart';
import 'package:nextcart/features/checkout/presentation/views/payment_success_view.dart';
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
    GoRoute(
      path: RoutePaths.checkout,

      builder: (context, state) => const CheckoutView(),
    ),
    GoRoute(
      path: RoutePaths.paymentSuccess,

      builder: (context, state) {
        final response = state.extra as CheckoutEntity;
        return PaymentSuccessView(response: response);
      },
    ),
    GoRoute(
      path: RoutePaths.paymentDelay,
      builder: (context, state) {
        final orderId = state.extra as String?;
        return PaymentDelayView(orderId: orderId);
      },
    ),
  ];
}
