import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'product_favorite_button.dart';

class ProductCardImage extends StatelessWidget {
  final ProductEntity product;
  final Color? badgeColor;

  const ProductCardImage({
    super.key,
    required this.product,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedNetworkImage(
                url: product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Discount Badge
          if (product.discountPercentage > 0)
            Positioned(
              top: 0,
              left: 0,
              child: Skeleton.ignore(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor ?? context.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "${product.discountPercentage.toInt()}% OFF",
                    style: AppTextStyles.medium12(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.w(context),
                    ),
                  ),
                ),
              ),
            ),
          // Favorite Icon Button
          ProductFavoriteButton(product: product),
        ],
      ),
    );
  }
}
