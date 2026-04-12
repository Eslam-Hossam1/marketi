import 'package:flutter/material.dart';
import 'package:marketi/core/entities/brand_entity.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/brand_products/domain/params/brand_products_routing_params.dart';

class BrandItem extends StatelessWidget {
  final BrandEntity brand;
  const BrandItem({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushBrandProducts(
          context,
          params: BrandProductsRoutingParams(
            title: brand.name,
            brand: brand.name,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                brand.emoji,
                style: TextStyle(fontSize: 24.w(context)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                brand.name,
                style: AppTextStyles.medium18(context)
                    .copyWith(color: context.mainTextColor),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.w(context),
              color: context.mainTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
