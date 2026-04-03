import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes/auth_routes.dart';

import 'onboarding_route.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
  ];
}
