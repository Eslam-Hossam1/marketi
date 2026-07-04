import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/spacing/width_space.dart';

class ProductDetailsRatingAndStockStatus extends StatelessWidget {
  final double rating;
  final bool inStock;

  const ProductDetailsRatingAndStockStatus({
    super.key,
    required this.rating,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w(context),
            vertical: 6.h(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r(context)),
            border: Border.all(
              width: 1.2,
              color: inStock ? context.primaryColor : Colors.red,
            ),
          ),
          child: Text(
            inStock ? 'In Stock' : 'Out of Stock',
            style: AppTextStyles.bold13(
              context,
            ).copyWith(color: inStock ? context.primaryColor : Colors.red),
          ),
        ),
        Row(
          children: [
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating.round() ? Icons.star : Icons.star_border,
                  color: index < rating.round() ? Colors.amber : Colors.grey,
                  size: 20.w(context),
                );
              }),
            ),
            const WidthSpace(width: 4),
            Text(
              '(${rating.toStringAsFixed(1)})',
              style: AppTextStyles.regular14(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
