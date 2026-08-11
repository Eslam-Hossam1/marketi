import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/orders/domain/entities/order_entity.dart';

import 'order_status_badge.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy - hh:mm a');
    
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushOrderDetails(context, orderId: order.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h(context)),
        padding: EdgeInsets.all(16.r(context)),
        decoration: BoxDecoration(
          color: context.outlineColor,
          borderRadius: BorderRadius.circular(16.r(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id.substring(0, 8).toUpperCase()}',
                  style: AppTextStyles.semiBold16(context).copyWith(color: context.mainTextColor),
                ),
                OrderStatusBadge(status: order.status),
              ],
            ),
            SizedBox(height: 12.h(context)),
            Text(
              dateFormat.format(order.createdAt),
              style: AppTextStyles.regular14(context).copyWith(color: context.secondaryTextColor),
            ),
            SizedBox(height: 12.h(context)),
            Divider(color: context.secondaryTextColor.withOpacity(0.1)),
            SizedBox(height: 12.h(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: AppTextStyles.regular14(context).copyWith(color: context.secondaryTextColor),
                ),
                Text(
                  '\$${order.totalAmount.toStringAsFixed(2)}',
                  style: AppTextStyles.bold16(context).copyWith(color: context.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
