import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/summary_row_item.dart';
import '../../domain/entities/checkout_entity.dart';

class PaymentSuccessSummaryCard extends StatelessWidget {
  const PaymentSuccessSummaryCard({super.key, required this.response});

  final CheckoutEntity response;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r(context)),
      decoration: BoxDecoration(
        color: context.formColor,
        borderRadius: BorderRadius.circular(16.r(context)),
        border: Border.all(
            color: context.secondaryTextColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          SummaryRowItem(
            label: 'Amount Paid',
            value: '${response.total.toStringAsFixed(2)} USD',
            labelStyle: AppTextStyles.regular14(context)
                .copyWith(color: context.mainTextColor),
            valueStyle: AppTextStyles.bold18(context)
                .copyWith(color: context.primaryColor),
          ),
          SizedBox(height: 12.h(context)),
          Divider(
              color: context.secondaryTextColor.withValues(alpha: 0.1)),
          SizedBox(height: 12.h(context)),
          SummaryRowItem(
            label: 'Order ID',
            value: '#${response.orderId.substring(0, 8).toUpperCase()}',
            labelStyle: AppTextStyles.regular14(context)
                .copyWith(color: context.mainTextColor),
            valueStyle: AppTextStyles.semiBold14(context)
                .copyWith(color: context.mainTextColor),
          ),
        ],
      ),
    );
  }
}
