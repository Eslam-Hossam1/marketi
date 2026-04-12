import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';
import 'package:marketi/features/category_products/domain/params/category_products_routing_params.dart';
import 'package:marketi/core/entities/category_entity.dart';

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
            categorySlug: category.slug,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: CustomCachedNetworkImage(
                url: category.image,
                width: 32.w(context),
                height: 32.h(context),
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
