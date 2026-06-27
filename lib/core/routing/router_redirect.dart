import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/storage_services/preferences/preferences_keys.dart';
import '../services/storage_services/preferences/preferences_service.dart';
import 'routes_paths.dart';

class RouterRedirect {
  final PreferencesService _preferencesService;

  const RouterRedirect({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  String? redirect(BuildContext context, GoRouterState state) {
    bool isAppJustOpenedNormally =
        state.matchedLocation == RoutePaths.initialRoute;

    if (isAppJustOpenedNormally) {
      return determineInitialView();
    } else {
      return null;
    }
  }

  String determineInitialView() {
    final bool onboardingCompleted = _preferencesService.getBool(
          key: PreferencesKeys.onboardingCompleted,
        ) ??
        false;

    if (!onboardingCompleted) {
      return RoutePaths.onboarding;
    } else {
      final isUserLoggedIn = Supabase.instance.client.auth.currentSession != null;
      return isUserLoggedIn ? RoutePaths.home : RoutePaths.login;
    }
  }
}
