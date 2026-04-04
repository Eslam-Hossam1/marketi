import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_page_view/onboarding_page_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return PageView.builder(
      controller: cubit.pageController,
      onPageChanged: cubit.onPageChanged,
      itemCount: OnboardingCubit.pages.length,
      itemBuilder: (_, index) => OnboardingPageItem(
        page: OnboardingCubit.pages[index],
      ),
    );
  }
}
