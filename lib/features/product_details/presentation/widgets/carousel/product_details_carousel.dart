import 'package:flutter/material.dart';
import 'product_details_carousel_indicator.dart';
import 'product_details_carousel_thumbnails.dart';
import 'product_details_carousel_view.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';

class ProductDetailsCarousel extends StatefulWidget {
  final List<String> images;

  const ProductDetailsCarousel({super.key, required this.images});

  @override
  State<ProductDetailsCarousel> createState() => _ProductDetailsCarouselState();
}

class _ProductDetailsCarouselState extends State<ProductDetailsCarousel> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        ProductDetailsCarouselView(
          images: widget.images,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
        ),
        const HeightSpace(height: 16),
        ProductDetailsCarouselIndicator(
          itemCount: widget.images.length,
          currentIndex: _currentIndex,
        ),
        const HeightSpace(height: 16),
        ProductDetailsCarouselThumbnails(
          images: widget.images,
          currentIndex: _currentIndex,
          onThumbnailTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
