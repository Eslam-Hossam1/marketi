import 'package:flutter/material.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class CustomNetworkCircleImage extends StatelessWidget {
  const CustomNetworkCircleImage({
    super.key,
    required this.userImageUrl,
    this.baseSize = 150,
  });

  final String userImageUrl;
  final double baseSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: baseSize,
      height: baseSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.outlineColor,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: CustomCachedNetworkImage(
          url: userImageUrl,
          width: baseSize,
          height: baseSize,
        ),
      ),
    );
  }
}
