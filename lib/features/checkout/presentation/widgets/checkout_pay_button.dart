import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';

class CheckoutPayButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const CheckoutPayButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w(context),
        vertical: 16.h(context),
      ),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r(context)),
          topRight: Radius.circular(24.r(context)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: CustomButton(
          width: double.infinity,
          borderRadius: 16.r(context),
          isLoading: isLoading,
          onPressed: onPressed,
          child: Text(
            'Pay Now',
            style: AppTextStyles.bold16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
