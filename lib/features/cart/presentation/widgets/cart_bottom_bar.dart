import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/orders/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:nextcart/features/orders/presentation/manager/checkout_cubit/checkout_state.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class CartBottomBar extends StatelessWidget {
  final int itemCount;
  final double subtotal;

  const CartBottomBar({
    super.key,
    required this.itemCount,
    required this.subtotal,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtotal Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal ($itemCount items)',
                  style: AppTextStyles.medium16(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
                Text(
                  '${subtotal.toStringAsFixed(2)} EGP',
                  style: AppTextStyles.bold18(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h(context)),
            // Checkout Button
            BlocConsumer<CheckoutCubit, CheckoutState>(
              listener: (context, state) {
                if (state is CheckoutFailure) {
                  DialogHelper.showErrorDialog(context, errorMessage: state.message);
                } else if (state is CheckoutSuccess) {
                  // After successful payment, we should navigate to orders or show success
                  context.read<CartCubit>().getCart(); // refresh to show empty cart
                  DialogHelper.showSuccessDialog(
                    context,
                    message: 'Payment completed successfully!',
                    btnOkOnPress: () {
                      context.push(RoutePaths.orders);
                    },
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  width: double.infinity,
                  borderRadius: 16.r(context),
                  isLoading: state is CheckoutLoading,
                  onPressed: () {
                    if (itemCount > 0) {
                      context.read<CheckoutCubit>().checkout(currency: 'usd');
                    }
                  },
                  child: Text(
                    'Checkout',
                    style: AppTextStyles.bold16(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
