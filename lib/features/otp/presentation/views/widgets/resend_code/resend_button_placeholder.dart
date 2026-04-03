import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/theme_colors_extension.dart';

class ResendButtonPlaceholder extends StatelessWidget {
  final String timerText;

  const ResendButtonPlaceholder({
    super.key,
    this.timerText = '15s', // Default static text
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.medium14(context).copyWith(
      color: context.secondaryTextColor,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Resend code on email in ', style: textStyle),
        Text(
          timerText, // Static text instead of a countdown
          style: textStyle,
        ),
      ],
    );
  }
}
