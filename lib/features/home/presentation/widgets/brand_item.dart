import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class BrandItem extends StatelessWidget {
  final String imageUrl;

  const BrandItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w(context),
      height: 100.h(context),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.outlineColor.withValues(alpha: 0.1)),
      ),
      child: CustomCachedNetworkImage(
        url: imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
