import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_state.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
          context.go(RoutePaths.login);
        }
      },
      child: const Scaffold(body: SafeArea(child: OnboardingViewBody())),
    );
  }
}
