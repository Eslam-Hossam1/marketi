import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import '../../domain/entities/order_status.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final Color textColor;
    final String text;

    switch (status) {
      case OrderStatus.pendingPayment:
        backgroundColor = Colors.orange.withValues(alpha: 0.1);
        textColor = Colors.orange;
        text = 'Pending Payment';
        break;
      case OrderStatus.paid:
        backgroundColor = Colors.blue.withValues(alpha: 0.1);
        textColor = Colors.blue;
        text = 'Paid';
        break;
      case OrderStatus.processing:
        backgroundColor = Colors.purple.withValues(alpha: 0.1);
        textColor = Colors.purple;
        text = 'Processing';
        break;
      case OrderStatus.shipped:
        backgroundColor = Colors.cyan.withValues(alpha: 0.1);
        textColor = Colors.cyan;
        text = 'Shipped';
        break;
      case OrderStatus.delivered:
        backgroundColor = Colors.green.withValues(alpha: 0.1);
        textColor = Colors.green;
        text = 'Delivered';
        break;
      case OrderStatus.cancelled:
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        textColor = Colors.red;
        text = 'Cancelled';
        break;
      case OrderStatus.refunded:
        backgroundColor = Colors.grey.withValues(alpha: 0.1);
        textColor = Colors.grey;
        text = 'Refunded';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 12.w(context), vertical: 4.h(context)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Text(
        text,
        style: AppTextStyles.medium12(context).copyWith(color: textColor),
      ),
    );
  }
}
