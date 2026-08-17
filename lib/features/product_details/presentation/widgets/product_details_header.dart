import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

import 'product_details_cart_icon_button.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w(context),
        vertical: 8.h(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text(
            'Product Details',
            style: AppTextStyles.medium18(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          const ProductDetailsCartIconButton(),
        ],
      ),
    );
  }
}
