import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';
import '../../domain/entities/checkout_entity.dart';
import '../widgets/payment_success_summary_card.dart';

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
                style: AppTextStyles.bold24(context)
                    .copyWith(color: context.mainTextColor),
              ),
              SizedBox(height: 12.h(context)),
              Text(
                'Your order has been successfully placed.',
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16(context)
                    .copyWith(color: context.secondaryTextColor),
              ),
              SizedBox(height: 32.h(context)),
              PaymentSuccessSummaryCard(response: response),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  RoutingHelper.pushOrderDetails(
                    context,
                    orderId: response.orderId,
                    fromCheckout: true,
                  );
                },
                borderRadius: 16.r(context),
                child: Text(
                  'View Order',
                  style: AppTextStyles.bold16(context)
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 12.h(context)),
              CustomButton(
                onPressed: () => context.go(RoutePaths.home),
                backgroundColor: context.formColor,
                borderRadius: 16.r(context),
                child: Text(
                  'Continue Shopping',
                  style: AppTextStyles.bold16(context)
                      .copyWith(color: context.mainTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
