import 'package:flutter/widgets.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/onboarding/domain/entities/onboarding_page_entity.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingPageEntity page;

  const OnboardingPageItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Image.asset(
              page.imagePath,
              fit: BoxFit.contain,
              width: 255.w(context),
            ),
          ),
        ),

        Expanded(
          flex: 4,
          child: Column(
            children: [
              SizedBox(height: 24.h(context)),
              Text(
                page.title,
                style: AppTextStyles.textStyleSemiBold20(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h(context)),
              Text(
                page.description,
                style: AppTextStyles.regular16(
                  context,
                ).copyWith(color: context.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
