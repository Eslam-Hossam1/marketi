import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes/auth_routes.dart';
import 'package:marketi/core/routing/app_routes/otp_route.dart';

import 'package:marketi/core/routing/app_routes/profile_route.dart';

import 'onboarding_route.dart';
import 'reset_password_routes.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...ResetPasswordRoutes.routes,
    ...OtpRoute.routes,
    ...ProfileRoute.routes,
  ];
}
