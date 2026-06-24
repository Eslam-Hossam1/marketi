import 'package:flutter/material.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

class ProductCardTitle extends StatelessWidget {
  final ProductEntity product;
  const ProductCardTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.bold14(
        context,
      ).copyWith(color: context.mainTextColor),
    );
  }
}
