import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/features/category_products/domain/params/category_products_routing_params.dart';
import 'package:nextcart/core/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushCategoryProducts(
          context,
          params: CategoryProductsRoutingParams(
            title: category.name,
            categorySlug: category.name,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60.w(context),
            height: 60.w(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.primaryColor.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: ClipOval(
              child: CustomCachedNetworkImage(
                url: category.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: AppTextStyles.regular14(context)
                .copyWith(color: context.mainTextColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
