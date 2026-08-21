import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';

class CartItemImage extends StatelessWidget {
  final String imageUrl;

  const CartItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r(context)),
      child: SizedBox(
        width: 105.w(context),
        height: 105.h(context),
        child: CustomCachedNetworkImage(
          url: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
