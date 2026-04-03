import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes/all_routs.dart';
import 'routes_paths.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RoutePaths.login,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}
