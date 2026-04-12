import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/entities/category_entity.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutePaths.categoryProducts,
          extra: {
            'title': category.name,
            'categorySlug': category.slug,
          },
        );
      },
      child: Container(
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
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.primaryColor.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: CustomCachedNetworkImage(
                  url: category.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium14(context)
                    .copyWith(color: context.mainTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
