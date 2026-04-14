import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_empty_widget.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              current is CartLoading ||
              current is CartSuccess ||
              current is CartFailure ||
              current is CartEmpty,
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
    );
  }
}
