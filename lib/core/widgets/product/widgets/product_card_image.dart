import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';
import 'package:marketi/core/entities/product_entity.dart';

class ProductCardImage extends StatelessWidget {
  final ProductEntity product;

  const ProductCardImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomCachedNetworkImage(
                url: product.thumbnail,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Discount Badge
          if (product.discountPercentage > 0)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: context.primaryColor.withValues(alpha: 0.25),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  "${product.discountPercentage.toInt()}% OFF",
                  style: AppTextStyles.medium12(context).copyWith(
                    color: context.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.w(context),
                  ),
                ),
              ),
            ),
          // Favorite Icon
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_border,
                size: 18.w(context),
                color: context.mainTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
