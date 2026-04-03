import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';

class CustomBackButtonWithTitleHeader extends StatelessWidget {
  final String title;
  const CustomBackButtonWithTitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w(context),
              color: context.primaryColor,
            ),
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(
              color: context.primaryColor.withValues(alpha: 0.2),
            ),
          ),
        ),
        WidthSpace(width: 12),
        Text(
          title,
          style: AppTextStyles.medium18(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
