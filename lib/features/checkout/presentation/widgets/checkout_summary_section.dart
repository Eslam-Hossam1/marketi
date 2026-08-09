import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../domain/entities/checkout_entity.dart';

class CheckoutSummarySection extends StatelessWidget {
  final CheckoutEntity response;

  const CheckoutSummarySection({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    // Read the cart items to show the itemized list
    final cartItems = context.read<CartCubit>().cartItems;

    return Container(
      padding: EdgeInsets.all(16.r(context)),
      decoration: BoxDecoration(
        color: context.outlineColor,
        borderRadius: BorderRadius.circular(16.r(context)),
        border: Border.all(color: context.secondaryTextColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: AppTextStyles.bold16(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          SizedBox(height: 16.h(context)),

          // Cart Items List
          ...cartItems.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${item.quantity}x ${item.product.title}',
                      style: AppTextStyles.regular14(
                        context,
                      ).copyWith(color: context.secondaryTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${(item.product.price * item.quantity).toStringAsFixed(2)} USD',
                    style: AppTextStyles.semiBold14(
                      context,
                    ).copyWith(color: context.mainTextColor),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 8.h(context)),
          Divider(color: context.secondaryTextColor.withOpacity(0.1)),
          SizedBox(height: 12.h(context)),

          // Server-verified totals
          _buildSummaryRow(context, 'Subtotal', response.subtotal),
          SizedBox(height: 8.h(context)),
          _buildSummaryRow(context, 'Shipping', response.shipping),
          SizedBox(height: 8.h(context)),
          _buildSummaryRow(context, 'Tax', response.tax),
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
                '${response.total.toStringAsFixed(2)} USD',
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
          ).copyWith(color: context.secondaryTextColor),
        ),
        Text(
          '${amount.toStringAsFixed(2)} USD',
          style: AppTextStyles.semiBold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
