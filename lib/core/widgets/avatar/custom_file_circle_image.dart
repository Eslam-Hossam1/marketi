import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class CustomFileCircleImage extends StatelessWidget {
  const CustomFileCircleImage({
    super.key,
    required this.image,
    this.baseSize = 150,
  });

  final File image;
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
        child: Image.file(
          image,
          width: baseSize,
          height: baseSize,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
