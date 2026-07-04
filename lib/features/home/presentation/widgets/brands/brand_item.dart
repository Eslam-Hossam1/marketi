import 'package:flutter/material.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/entities/brand_entity.dart';
import 'package:nextcart/features/brand_products/domain/params/brand_products_routing_params.dart';

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
        width: 100.w(context),
        height: 100.h(context),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.outlineColor.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCachedNetworkImage(
              url: brand.image,
              width: 40.w(context),
              height: 40.h(context),
              placeHolder: SizedBox(
                width: 24.w(context),
                height: 24.w(context),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              brand.name,
              style: AppTextStyles.medium12(
                context,
              ).copyWith(color: context.mainTextColor),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
