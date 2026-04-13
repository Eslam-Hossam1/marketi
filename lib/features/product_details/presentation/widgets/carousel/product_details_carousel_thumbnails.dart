import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class ProductDetailsCarouselThumbnails extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final Function(int) onThumbnailTap;

  const ProductDetailsCarouselThumbnails({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.onThumbnailTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onThumbnailTap(index),
            child: Container(
              width: 60.w(context),
              margin: EdgeInsets.only(right: 12.w(context)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r(context)),
                border: Border.all(
                  color: isSelected ? context.primaryColor : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r(context)),
                child: CustomCachedNetworkImage(
                  url: images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
