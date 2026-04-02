import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_dots_indicator_and_next_button_section/onboarding_and_next_button_section.dart';
import 'package:marketi/features/onboarding/presentation/widgets/onboarding_page_view/onboarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w(context)),
      child: Column(
        children: [
          SizedBox(height: 12.h(context)),
          Expanded(child: const OnboardingPageView()),
          DotsIndicatorAndNextButtonSection(),
        ],
      ),
    );
  }
}
