import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';

import 'stepper_button.dart';

class CartItemStepper extends StatelessWidget {
  final String productId;

  const CartItemStepper({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          (current is UpdateCartQuantitySuccess &&
              current.productId == productId) ||
          (current is UpdateCartQuantityFailure &&
              current.productId == productId) ||
          (current is RemoveFromCartLoading &&
              current.productId == productId) ||
          (current is RemoveFromCartSuccess &&
              current.productId == productId) ||
          (current is RemoveFromCartFailure && current.productId == productId),
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final quantity = cubit.getQuantity(productId);
        final isRemoving =
            state is RemoveFromCartLoading && state.productId == productId;

        return Row(
          children: [
            // Decrement / Delete button
            StepperButton(
              isRound: false,
              isDelete: quantity <= 1,
              isLoading: isRemoving,
              icon: quantity <= 1
                  ? Icons.delete_outline_rounded
                  : Icons.remove_rounded,
              onTap: isRemoving
                  ? null
                  : () => cubit.updateQuantity(productId, quantity - 1),
            ),
            // Quantity display — always shows the live optimistic value.
            Expanded(
              child: Center(
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold16(
                    context,
                  ).copyWith(color: context.mainTextColor),
                ),
              ),
            ),
            // Increment button
            StepperButton(
              isRound: false,
              isDelete: false,
              icon: Icons.add_rounded,
              isLoading: false,
              onTap: isRemoving
                  ? null
                  : () => cubit.updateQuantity(productId, quantity + 1),
            ),
          ],
        );
      },
    );
  }
}
