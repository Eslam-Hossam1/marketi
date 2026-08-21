import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/summary_row_item.dart';
import '../../domain/entities/order_entity.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r(context)),
      decoration: BoxDecoration(
        color: context.formColor,
        borderRadius: BorderRadius.circular(16.r(context)),
        border: Border.all(
            color: context.secondaryTextColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: AppTextStyles.bold16(context)
                .copyWith(color: context.mainTextColor),
          ),
          SizedBox(height: 16.h(context)),
          SummaryRowItem(
            label: 'Subtotal',
            value: '\$${order.subtotalAmount.toStringAsFixed(2)}',
          ),
          SizedBox(height: 8.h(context)),
          SummaryRowItem(
            label: 'Shipping',
            value: '\$${order.shippingAmount.toStringAsFixed(2)}',
          ),
          SizedBox(height: 8.h(context)),
          SummaryRowItem(
            label: 'Tax',
            value: '\$${order.taxAmount.toStringAsFixed(2)}',
          ),
          SizedBox(height: 12.h(context)),
          Divider(
              color: context.secondaryTextColor.withValues(alpha: 0.1)),
          SizedBox(height: 12.h(context)),
          SummaryRowItem(
            label: 'Total',
            value: '\$${order.totalAmount.toStringAsFixed(2)}',
            labelStyle: AppTextStyles.bold16(context)
                .copyWith(color: context.mainTextColor),
            valueStyle: AppTextStyles.bold18(context)
                .copyWith(color: context.primaryColor),
          ),
        ],
      ),
    );
  }
}
