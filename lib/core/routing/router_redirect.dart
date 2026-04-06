import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_credentials_manager/auth_credentials_manager.dart';
import '../services/storage_services/preferences/preferences_keys.dart';
import '../services/storage_services/preferences/preferences_service.dart';
import 'routes_paths.dart';

class RouterRedirect {
  final PreferencesService _preferencesService;
  final AuthCredentialsManager _authCredentialsManager;

  const RouterRedirect({
    required PreferencesService preferencesService,
    required AuthCredentialsManager authCredentialsManager,
  })  : _preferencesService = preferencesService,
        _authCredentialsManager = authCredentialsManager;

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
      return _authCredentialsManager.userIsAuthenticated()
          ? RoutePaths.home
          : RoutePaths.login;
    }
  }
}
