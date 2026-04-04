import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';

class BrandItem extends StatelessWidget {
  final BrandEntity brand;

  const BrandItem({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w(context),
      height: 100.h(context),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.outlineColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(brand.emoji, style: TextStyle(fontSize: 24.w(context))),
          const SizedBox(height: 8),
          Text(
            brand.name,
            style: AppTextStyles.medium12(context),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
