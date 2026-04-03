import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingNextButton extends StatelessWidget {
  final int currentPage;

  const OnboardingNextButton({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final isLast = currentPage == OnboardingCubit.pages.length - 1;
    return SizedBox(
      width: double.infinity,
      child: CustomTextButton(
        onPressed: context.read<OnboardingCubit>().nextPage,
        text: isLast ? 'Get Start' : 'Next',
      ),
    );
  }
}
