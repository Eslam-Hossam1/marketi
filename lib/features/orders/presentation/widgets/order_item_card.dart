import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import '../../domain/entities/order_item_entity.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.item});

  final OrderItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r(context)),
          child: CustomCachedNetworkImage(
            url: item.productImage,
            width: 60.w(context),
            height: 60.w(context),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.productName,
                style: AppTextStyles.semiBold14(context)
                    .copyWith(color: context.mainTextColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h(context)),
              Text(
                '\$${item.unitPrice.toStringAsFixed(2)} x ${item.quantity}',
                style: AppTextStyles.regular12(context)
                    .copyWith(color: context.mainTextColor),
              ),
            ],
          ),
        ),
        Text(
          '\$${item.subtotal.toStringAsFixed(2)}',
          style: AppTextStyles.semiBold14(context)
              .copyWith(color: context.primaryColor),
        ),
      ],
    );
  }
}
