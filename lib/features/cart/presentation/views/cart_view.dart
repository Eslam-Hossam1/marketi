import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/widgets/custom_circular_progress_indecator.dart';
import 'package:nextcart/core/widgets/custom_failure_message_with_button.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:nextcart/features/cart/presentation/widgets/cart_empty_widget.dart';
import 'package:nextcart/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CartCubit, CartState>(
          listenWhen: (_, current) => current is UpdateCartQuantityFailure,
          listener: (context, state) {
            if (state is UpdateCartQuantityFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red.shade700,
                    duration: const Duration(seconds: 3),
                  ),
                );
            }
          },
          child: BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current is CartLoading ||
                current is GetCartSuccess ||
                current is CartFailure ||
                current is CartEmpty ||
                current is CartNotEmpty,
            builder: (context, state) {
              if (state is CartLoading) {
                return const CustomCircularProgressIndecator();
              }
              if (state is CartFailure) {
                return CustomFailureMessageWithButton(
                  failureMessage: state.errorMessage,
                  onPressed: () => context.read<CartCubit>().getCart(),
                );
              }
              if (state is CartEmpty) {
                return const CartEmptyWidget();
              }
              return const CartViewBody();
            },
          ),
        ),
      ),
    );
  }
}
