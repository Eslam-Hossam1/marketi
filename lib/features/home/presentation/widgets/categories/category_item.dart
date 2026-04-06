import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 85.w(context),
          height: 85.h(context),
          decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.primaryColor.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.5),
            child: CustomCachedNetworkImage(
              url: category.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          style: AppTextStyles.bold16(
            context,
          ).copyWith(color: context.mainTextColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
