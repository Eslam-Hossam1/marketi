import 'package:flutter/material.dart';
import 'package:marketi/core/utils/assets.dart';

class AppLogoImage extends StatelessWidget {
  const AppLogoImage({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesPngAppLogo,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
