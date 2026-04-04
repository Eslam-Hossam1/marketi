import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class HomePromoBanner extends StatelessWidget {
  const HomePromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomCachedNetworkImage(
            url:
                "https://img.freepik.com/premium-vector/sale-promotion-banner-template_74379-177.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
