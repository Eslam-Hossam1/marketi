import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/domain/entities/cart_item_entity.dart';
import 'package:nextcart/core/routing/routing_helper.dart';

import 'cart_item_image.dart';
import 'cart_item_info.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushProductDetails(
          context,
          productId: cartItem.product.id,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w(context),
          vertical: 6.h(context),
        ),
        padding: EdgeInsets.all(12.w(context)),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16.r(context)),
          border: Border.all(
            color: context.primaryColor.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CartItemImage(imageUrl: cartItem.product.thumbnail),
            SizedBox(width: 12.w(context)),
            Expanded(
              child: CartItemInfo(cartItem: cartItem),
            ),
          ],
        ),
      ),
    );
  }
}
