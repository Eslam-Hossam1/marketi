import '../routes_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingRoute {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) =>
        const Scaffold(body: Center(child: Text('Onboarding placeholder'))),
  );

  static List<GoRoute> routes = [onboarding];
}
