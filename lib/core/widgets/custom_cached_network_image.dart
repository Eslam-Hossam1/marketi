import 'package:cached_network_image/cached_network_image.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    this.placeHolder,
    this.width,
    this.height,
  });

  final String url;
  final Widget? placeHolder;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) =>
          placeHolder ??
          Container(color: context.cachedNetworkImagePlaceholderColor),
      errorWidget: (context, url, error) =>
          Image.asset(Assets.imagesPngImagePlaceholder, fit: BoxFit.cover),
    );
  }
}
