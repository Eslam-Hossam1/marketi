import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';
import '../../domain/entities/checkout_entity.dart';

class PaymentSuccessView extends StatelessWidget {
  final CheckoutEntity response;

  const PaymentSuccessView({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(
                Icons.check_circle_outline,
                size: 100.w(context),
                color: context.primaryColor,
              ),
              SizedBox(height: 24.h(context)),
              Text(
                'Payment Successful!',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold24(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              SizedBox(height: 12.h(context)),
              Text(
                'Your order has been successfully placed.',
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              SizedBox(height: 32.h(context)),
              _buildSummaryCard(context),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  context.go(RoutePaths.orders);
                },
                borderRadius: 16.r(context),
                child: Text(
                  'View My Orders',
                  style: AppTextStyles.bold16(context).copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 12.h(context)),
              CustomButton(
                onPressed: () {
                  context.go(RoutePaths.home);
                },
                backgroundColor: context.outlineColor,
                borderRadius: 16.r(context),
                child: Text(
                  'Continue Shopping',
                  style: AppTextStyles.bold16(context).copyWith(color: context.mainTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r(context)),
      decoration: BoxDecoration(
        color: context.outlineColor,
        borderRadius: BorderRadius.circular(16.r(context)),
        border: Border.all(color: context.secondaryTextColor.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount Paid',
                style: AppTextStyles.regular14(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              Text(
                '${response.total.toStringAsFixed(2)} USD',
                style: AppTextStyles.bold18(context).copyWith(
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h(context)),
          Divider(color: context.secondaryTextColor.withOpacity(0.1)),
          SizedBox(height: 12.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID',
                style: AppTextStyles.regular14(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              Text(
                '#${response.orderId.substring(0, 8).toUpperCase()}',
                style: AppTextStyles.semiBold14(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
