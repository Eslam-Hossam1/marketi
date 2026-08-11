import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
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
        border: Border.all(color: context.secondaryTextColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: AppTextStyles.bold16(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          SizedBox(height: 16.h(context)),
          _buildSummaryRow(context, 'Subtotal', order.subtotalAmount),
          SizedBox(height: 8.h(context)),
          _buildSummaryRow(context, 'Shipping', order.shippingAmount),
          SizedBox(height: 8.h(context)),
          _buildSummaryRow(context, 'Tax', order.taxAmount),
          SizedBox(height: 12.h(context)),
          Divider(color: context.secondaryTextColor.withOpacity(0.1)),
          SizedBox(height: 12.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyles.bold16(
                  context,
                ).copyWith(color: context.mainTextColor),
              ),
              Text(
                '\$${order.totalAmount.toStringAsFixed(2)}',
                style: AppTextStyles.bold18(
                  context,
                ).copyWith(color: context.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.regular14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: AppTextStyles.semiBold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
