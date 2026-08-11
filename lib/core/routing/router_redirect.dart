import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/storage_services/preferences/preferences_keys.dart';
import '../services/storage_services/preferences/preferences_service.dart';
import 'routes_paths.dart';

class RouterRedirect {
  final PreferencesService _preferencesService;

  /// All routes that live inside the authenticated ShellRoute.
  /// Accessing any of these while logged out redirects to login.
  static const _protectedPaths = {
    RoutePaths.home,
    RoutePaths.cart,
    RoutePaths.favorites,
    RoutePaths.profile,
    RoutePaths.editProfile,
    RoutePaths.themeSelection,
    RoutePaths.products,
    RoutePaths.brands,
    RoutePaths.categories,
    RoutePaths.search,
    RoutePaths.categoryProducts,
    RoutePaths.brandProducts,
    RoutePaths.productDetails,
    RoutePaths.orders,
    RoutePaths.orderDetails,
    RoutePaths.checkout,
    RoutePaths.paymentSuccess,
    RoutePaths.paymentDelay,
  };

  const RouterRedirect({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  String? redirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = Supabase.instance.client.auth.currentSession != null;
    final location = state.matchedLocation;

    // Initial route: determine where to start.
    if (location == RoutePaths.initialRoute) {
      return determineInitialView();
    }

    // Guard: any protected route accessed while not logged in → login.
    if (_protectedPaths.contains(location) && !isLoggedIn) {
      return RoutePaths.login;
    }

    return null;
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
