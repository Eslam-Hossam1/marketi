import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/widgets/spacing/height_space.dart';
import '../../../domain/entities/product_details_entity.dart';
import 'product_details_rating_and_stock_status.dart';
import 'product_details_title_and_description.dart';

class ProductDetailsInfo extends StatelessWidget {
  final ProductDetailsEntity product;

  const ProductDetailsInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsRatingAndStockStatus(
            rating: product.rating,
            inStock: product.stock > 0,
          ),
          const HeightSpace(height: 16),
          ProductDetailsTitleAndDescription(
            title: product.title,
            description: product.description,
          ),
        ],
      ),
    );
  }
}
