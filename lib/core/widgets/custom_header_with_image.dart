import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/avatar/global_profile_avatar.dart';

class CustomHeaderWithImage extends StatelessWidget {
  final String title;
  const CustomHeaderWithImage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(12.w(context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.primaryColor.withValues(alpha: 0.1),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w(context),
              color: context.primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.bold20(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        const GlobalProfileAvatar(
          baseSize: 45,
        ),
      ],
    );
  }
}
