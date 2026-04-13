import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';

class ProductDetailsShippingAndRating extends StatelessWidget {
  final String? shippingInformation;
  final double rating;

  const ProductDetailsShippingAndRating({
    super.key,
    this.shippingInformation,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (shippingInformation != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w(context), vertical: 6.h(context)),
            decoration: BoxDecoration(
              color: context.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r(context)),
              border: Border.all(color: context.primaryColor),
            ),
            child: Text(
              shippingInformation!,
              style: AppTextStyles.medium13(context).copyWith(color: context.primaryColor),
            ),
          )
        else
          const SizedBox.shrink(),
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
              style: AppTextStyles.regular14(context).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
