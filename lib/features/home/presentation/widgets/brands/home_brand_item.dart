import 'package:flutter/material.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/entities/brand_entity.dart';
import 'package:nextcart/features/brand_products/domain/params/brand_products_routing_params.dart';

class HomeBrandItem extends StatelessWidget {
  final BrandEntity brand;

  const HomeBrandItem({super.key, required this.brand});

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
        margin: .only(bottom: 16.h(context)),
        width: 100.w(context),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.outlineColor.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border.all(
            color: context.brandBackground.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.brandBackground,
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 40.w(context),
                height: 40.h(context),
                child: CustomCachedNetworkImage(
                  url: brand.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                brand.name,
                style: AppTextStyles.medium12(context).copyWith(
                  color: context.mainTextColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
