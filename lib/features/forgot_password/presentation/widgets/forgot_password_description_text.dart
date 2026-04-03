import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class ForgotPasswordDescriptionText extends StatelessWidget {
  const ForgotPasswordDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
      child: Text(
        'Please enter your email address to receive a verification code',
        textAlign: TextAlign.center,
        style: AppTextStyles.medium16(context).copyWith(
          color: context.secondaryTextColor,
        ),
      ),
    );
  }
}
