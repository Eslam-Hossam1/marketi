import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.w(context),
            color: context.secondaryTextColor.withValues(alpha: 0.4),
          ),
          SizedBox(height: 16.h(context)),
          Text(
            'Your cart is empty',
            style: AppTextStyles.bold18(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'Browse products and add items to your cart',
            style: AppTextStyles.regular14(context).copyWith(
              color: context.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
