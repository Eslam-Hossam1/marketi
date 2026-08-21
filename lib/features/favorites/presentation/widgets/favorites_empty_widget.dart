import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 80.w(context),
            color: context.secondaryTextColor.withValues(alpha: 0.4),
          ),
          SizedBox(height: 16.h(context)),
          Text(
            'No favorites yet',
            style: AppTextStyles.bold18(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'Tap the heart icon on any product to save it here',
            textAlign: TextAlign.center,
            style: AppTextStyles.regular14(context).copyWith(
              color: context.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
