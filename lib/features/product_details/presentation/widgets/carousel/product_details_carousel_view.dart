import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class ProductDetailsCarouselView extends StatelessWidget {
  final List<String> images;
  final PageController controller;
  final Function(int) onPageChanged;

  const ProductDetailsCarouselView({
    super.key,
    required this.images,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h(context),
      width: double.infinity,
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return CustomCachedNetworkImage(
            url: images[index],
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
