import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int currentPage;

  const OnboardingDotsIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardingCubit.pages.length,
        (index) => Dot(isActive: index == currentPage),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF001640);
    const inactiveColor = Color(0xFFB2CCFF);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 15.w(context) : 13.w(context),
      height: isActive ? 15.w(context) : 13.w(context),
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
