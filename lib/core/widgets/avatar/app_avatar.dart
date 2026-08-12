import 'package:flutter/material.dart';
import 'package:nextcart/core/utils/assets.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final Color? backgroundColor;

  const AppAvatar({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: ClipOval(child: _buildImage()),
    );
  }

  Widget _buildImage() {
    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return _defaultAvatar();
    }

    return CustomCachedNetworkImage(
      url: imageUrl!,
      width: radius * 2,
      height: radius * 2,
    );
  }

  Widget _defaultAvatar() {
    return Image.asset(
      Assets.imagesPngDefaultAvatar,
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.cover,
    );
  }
}
