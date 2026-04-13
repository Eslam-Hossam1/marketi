import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class ProductDetailsCarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const ProductDetailsCarouselIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w(context)),
          width: isSelected ? 24.w(context) : 8.w(context),
          height: 8.h(context),
          decoration: BoxDecoration(
            color: isSelected ? context.primaryColor : context.primaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(4.r(context)),
          ),
        );
      }),
    );
  }
}
