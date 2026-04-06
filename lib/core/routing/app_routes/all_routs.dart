import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes/auth_routes.dart';
import 'package:marketi/core/routing/app_routes/main_route.dart';
import 'package:marketi/core/routing/app_routes/onboarding_route.dart';
import 'package:marketi/core/routing/app_routes/otp_route.dart';
import 'package:marketi/core/routing/app_routes/profile_route.dart';
import 'package:marketi/core/routing/app_routes/reset_password_routes.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    // Shell: home / cart / favorites / profile (with bottom nav)
    ...MainRoute.routes,

    // Standalone flows (no bottom nav)
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...ResetPasswordRoutes.routes,
    ...OtpRoute.routes,

    // Full-screen routes pushed on root navigator
    ...ProfileRoute.routes,
  ];
}
