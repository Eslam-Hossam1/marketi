import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class CustomScreenPlaceholder extends StatelessWidget {
  const CustomScreenPlaceholder({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: AppTextStyles.medium16(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
      ),
    );
  }
}
