import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/domain/entities/cart_item_entity.dart';

class CheckoutCartItemRow extends StatelessWidget {
  const CheckoutCartItemRow({super.key, required this.item});

  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${item.quantity}x ${item.product.title}',
              style: AppTextStyles.regular14(context)
                  .copyWith(color: context.mainTextColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${(item.product.price * item.quantity).toStringAsFixed(2)} USD',
            style: AppTextStyles.semiBold14(context)
                .copyWith(color: context.mainTextColor),
          ),
        ],
      ),
    );
  }
}
