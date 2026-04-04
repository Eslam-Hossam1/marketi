import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductCardInfo extends StatelessWidget {
  final ProductEntity product;
  final bool hasAddButton;

  const ProductCardInfo({
    super.key,
    required this.product,
    required this.hasAddButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price and Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.price.toInt()} LE",
                style: AppTextStyles.bold14(context).copyWith(
                  color: const Color(0xFF0D1B3E),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 18.w(context),
                    color: const Color(0xFF0D1B3E),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.rating.toString(),
                    style: AppTextStyles.medium14(
                      context,
                    ).copyWith(color: const Color(0xFF0D1B3E)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Title
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bold14(
              context,
            ).copyWith(color: const Color(0xFF0D1B3E)),
          ),
          if (hasAddButton) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 36.h(context),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Add",
                  style: AppTextStyles.bold14(
                    context,
                  ).copyWith(color: context.primaryColor),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
