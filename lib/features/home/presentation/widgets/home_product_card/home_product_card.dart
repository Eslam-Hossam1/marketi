import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'widgets/product_card_image.dart';
import 'widgets/product_card_info.dart';

class HomeProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool hasAddButton;

  const HomeProductCard({
    super.key,
    required this.product,
    this.hasAddButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductCardImage(product: product),
          ProductCardInfo(product: product, hasAddButton: hasAddButton),
        ],
      ),
    );
  }
}
