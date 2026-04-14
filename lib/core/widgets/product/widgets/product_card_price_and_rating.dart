import 'package:flutter/material.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';

class ProductCardPriceAndRating extends StatelessWidget {
  final ProductEntity product;
  const ProductCardPriceAndRating({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${product.price.toInt()} LE",
          style: AppTextStyles.bold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        Row(
          children: [
            Icon(
              Icons.star_border,
              size: 18.w(context),
              color: context.mainTextColor,
            ),
            const SizedBox(width: 4),
            Text(
              product.rating.toString(),
              style: AppTextStyles.medium14(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
