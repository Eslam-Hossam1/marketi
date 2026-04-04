import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/theme_colors_extension.dart';
import 'count_down_timer.dart';

class ResendCodeWithTimer extends StatelessWidget {
  const ResendCodeWithTimer({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.medium14(context).copyWith(
      color: context.secondaryTextColor,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Resend code on email in ', style: textStyle),
        CountdownTimer(
          seconds: 15,
          timertextStyle: textStyle,
        ),
      ],
    );
  }
}
