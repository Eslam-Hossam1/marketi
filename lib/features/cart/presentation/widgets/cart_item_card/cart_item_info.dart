import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/domain/entities/cart_item_entity.dart';

import 'cart_item_stepper.dart';

class CartItemInfo extends StatelessWidget {
  final CartItemEntity cartItem;

  const CartItemInfo({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          cartItem.product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        SizedBox(height: 4.h(context)),
        // Category
        Text(
          cartItem.product.category?.name ?? '',
          style: AppTextStyles.regular12(
            context,
          ).copyWith(color: context.secondaryTextColor),
        ),
        SizedBox(height: 8.h(context)),
        // Price + Rating row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price: ${cartItem.product.price.toStringAsFixed(2)} EGP',
              style: AppTextStyles.bold14(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 14.w(context),
                  color: const Color(0xFFFFA726),
                ),
                SizedBox(width: 2.w(context)),
                Text(
                  cartItem.product.rating.toStringAsFixed(1),
                  style: AppTextStyles.regular12(
                    context,
                  ).copyWith(color: context.secondaryTextColor),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h(context)),
        // Stepper — below price, inside info column
        CartItemStepper(productId: cartItem.product.id),
      ],
    );
  }
}
