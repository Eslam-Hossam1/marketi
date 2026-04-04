import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  const HomeSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bold20(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          Text(
            "View all",
            style: AppTextStyles.medium16(context).copyWith(
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
