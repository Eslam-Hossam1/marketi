
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_state.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_dots_indicator_and_next_button_section/onboarding_dots_indicator.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_dots_indicator_and_next_button_section/onboarding_next_button.dart';

class DotsIndicatorAndNextButtonSection extends StatelessWidget {
  const DotsIndicatorAndNextButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (prev, curr) =>
          curr is OnboardingPageChanged || curr is OnboardingInitial,
      builder: (context, state) {
        final currentPage = state is OnboardingPageChanged
            ? state.currentPage
            : 0;
        return Column(
          children: [
            SizedBox(height: 16.h(context)),
            OnboardingDotsIndicator(currentPage: currentPage),
            SizedBox(height: 16.h(context)),
            OnboardingNextButton(currentPage: currentPage),
            SizedBox(height: 16.h(context)),
          ],
        );
      },
    );
  }
}
