import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/routing/router_redirect.dart';
import 'package:nextcart/core/services/storage_services/preferences/preferences_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as import_supabase;

import 'app_routes/all_routs.dart';
import 'routes_paths.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final routerRedirect = RouterRedirect(
    preferencesService: getIt<PreferencesService>(),
  );

  static final router = GoRouter(
    redirect: routerRedirect.redirect,
    initialLocation: RoutePaths.initialRoute,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );

  static void setupDeepLinkListener() {
    import_supabase.Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == import_supabase.AuthChangeEvent.passwordRecovery) {
        router.go(RoutePaths.resetPassword);
      }
    });
  }
}


