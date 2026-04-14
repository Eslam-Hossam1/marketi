import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/features/product_details/domain/params/product_details_params.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'widgets/product_card_image.dart';
import 'widgets/product_card_price_and_rating.dart';
import 'widgets/product_card_title.dart';
import 'widgets/product_add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushProductDetails(
          context,
          params: ProductDetailsRoutingParams(productId: product.id),
        );
      },
      child: Container(
        width: 160.w(context),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCardImage(product: product),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCardPriceAndRating(product: product),
                    const SizedBox(height: 6),
                    ProductCardTitle(product: product),
                    Expanded(child: const SizedBox(height: 16)),
                    ProductAddToCartButton(product: product),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
