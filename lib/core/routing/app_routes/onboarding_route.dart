import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/services/storage_services/preferences/preferences_service.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';

import '../routes_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/features/onboarding/presentation/views/onboarding_view.dart';

class OnboardingRoute {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) => BlocProvider(
      create: (_) => OnboardingCubit(getIt<PreferencesService>()),
      child: const OnboardingView(),
    ),
  );

  static List<GoRoute> routes = [onboarding];
}
