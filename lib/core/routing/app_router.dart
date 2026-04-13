import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/router_redirect.dart';
import 'package:marketi/core/services/auth_credentials_manager/auth_credentials_manager.dart';
import 'package:marketi/core/services/storage_services/preferences/preferences_service.dart';

import 'app_routes/all_routs.dart';
import 'routes_paths.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final routerRedirect = RouterRedirect(
    preferencesService: getIt<PreferencesService>(),
    authCredentialsManager: getIt<AuthCredentialsManager>(),
  );

  static final router = GoRouter(
    redirect: routerRedirect.redirect,
    initialLocation: RoutePaths.productDetails,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}
