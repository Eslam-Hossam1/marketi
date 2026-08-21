import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import '../../domain/entities/order_item_entity.dart';
import 'order_item_card.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key, required this.items});

  final List<OrderItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items (${items.length})',
          style: AppTextStyles.bold16(context)
              .copyWith(color: context.mainTextColor),
        ),
        SizedBox(height: 12.h(context)),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h(context)),
            child: OrderItemCard(item: item),
          ),
        ),
      ],
    );
  }
}
