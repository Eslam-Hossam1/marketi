import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final double price;
  const ProductDetailsBottomBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: AppTextStyles.semiBold18(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
            Text(
              '${price.toStringAsFixed(2)} EGP',
              style: AppTextStyles.bold20(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
        CustomButton(
          onPressed: () {},
          width: 200.w(context),
          borderRadius: 16.r(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 20.w(context),
              ),
              const WidthSpace(width: 8),
              Text(
                'Add to Cart',
                style: AppTextStyles.medium16(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
