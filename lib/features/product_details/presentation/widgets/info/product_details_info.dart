import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import '../../../domain/entities/product_details_entity.dart';
import 'product_details_shipping_and_rating.dart';
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
          ProductDetailsShippingAndRating(
            shippingInformation: product.shippingInformation,
            rating: product.rating,
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
