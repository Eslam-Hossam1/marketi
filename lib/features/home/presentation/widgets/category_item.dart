import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w(context),
          height: 80.h(context),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.outlineColor.withValues(alpha: 0.1)),
          ),
          child: CustomCachedNetworkImage(url: imageUrl),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: AppTextStyles.medium14(context).copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
