import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import '../../domain/entities/order_entity.dart';
import 'order_status_badge.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy - hh:mm a');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order #${order.id.substring(0, 8).toUpperCase()}',
              style: AppTextStyles.bold18(context)
                  .copyWith(color: context.mainTextColor),
            ),
            OrderStatusBadge(status: order.status),
          ],
        ),
        SizedBox(height: 8.h(context)),
        Text(
          dateFormat.format(order.createdAt),
          style: AppTextStyles.regular14(context)
              .copyWith(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}
