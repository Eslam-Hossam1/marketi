import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/features/payment/presentation/views/payment_checkout_view.dart';
import 'package:marketi/features/payment/presentation/views/payment_failure_view.dart';
import 'package:marketi/features/payment/presentation/views/payment_success_view.dart';

abstract class PaymentRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.checkout,
      builder: (context, state) => PaymentCheckoutView(
        params: state.extra as PaymentParams,
      ),
    ),
    GoRoute(
      path: RoutePaths.paymentSuccess,
      builder: (context, state) => const PaymentSuccessView(),
    ),
    GoRoute(
      path: RoutePaths.paymentFailure,
      builder: (context, state) => const PaymentFailureView(),
    ),
  ];
}
