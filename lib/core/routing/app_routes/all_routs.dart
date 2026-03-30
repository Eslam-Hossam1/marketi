import 'package:go_router/go_router.dart';

import 'onboarding_route.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    ...OnboardingRoute.routes,
  ];
}
