import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';

class CartBottomBar extends StatelessWidget {
  final int itemCount;
  final double subtotal;

  const CartBottomBar({
    super.key,
    required this.itemCount,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w(context),
        vertical: 16.h(context),
      ),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r(context)),
          topRight: Radius.circular(24.r(context)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtotal Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal ($itemCount items)',
                  style: AppTextStyles.medium16(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
                Text(
                  '${subtotal.toStringAsFixed(2)} EGP',
                  style: AppTextStyles.bold18(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h(context)),
            // Checkout Button
            CustomButton(
              width: double.infinity,
              borderRadius: 16.r(context),
              onPressed: () {},
              child: Text(
                'Checkout',
                style: AppTextStyles.bold16(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
