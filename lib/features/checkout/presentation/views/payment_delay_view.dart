import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';

class PaymentDelayView extends StatelessWidget {
  const PaymentDelayView({super.key});

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
                Icons.hourglass_empty_rounded,
                size: 100.w(context),
                color: context.primaryColor,
              ),
              SizedBox(height: 24.h(context)),
              Text(
                'Processing Order...',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold24(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              SizedBox(height: 16.h(context)),
              Text(
                'We are verifying your payment, it may take few seconds.',
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16(context).copyWith(
                  color: context.secondaryTextColor,
                  height: 1.5,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
