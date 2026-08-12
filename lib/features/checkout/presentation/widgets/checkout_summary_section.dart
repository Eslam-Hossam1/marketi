import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/summary_row_item.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../domain/entities/checkout_entity.dart';
import 'checkout_cart_item_row.dart';

class CheckoutSummarySection extends StatelessWidget {
  final CheckoutEntity response;

  const CheckoutSummarySection({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartCubit>().cartItems;

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
            'Order Summary',
            style: AppTextStyles.bold16(context)
                .copyWith(color: context.mainTextColor),
          ),
          SizedBox(height: 16.h(context)),
          ...cartItems.map(
            (item) => CheckoutCartItemRow(item: item),
          ),
          SizedBox(height: 8.h(context)),
          Divider(
              color: context.secondaryTextColor.withValues(alpha: 0.1)),
          SizedBox(height: 12.h(context)),
          SummaryRowItem(
            label: 'Subtotal',
            value: '${response.subtotal.toStringAsFixed(2)} USD',
          ),
          SizedBox(height: 8.h(context)),
          SummaryRowItem(
            label: 'Shipping',
            value: '${response.shipping.toStringAsFixed(2)} USD',
          ),
          SizedBox(height: 8.h(context)),
          SummaryRowItem(
            label: 'Tax',
            value: '${response.tax.toStringAsFixed(2)} USD',
          ),
          SizedBox(height: 12.h(context)),
          Divider(
              color: context.secondaryTextColor.withValues(alpha: 0.1)),
          SizedBox(height: 12.h(context)),
          SummaryRowItem(
            label: 'Total',
            value: '${response.total.toStringAsFixed(2)} USD',
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
