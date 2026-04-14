import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'cart_header.dart';
import 'cart_item_card.dart';
import 'cart_bottom_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is CartSuccess ||
          current is RemoveFromCartSuccess ||
          current is CartEmpty,
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final products = cubit.cartProducts;

        return Column(
          children: [
            const CartHeader(),
            // Products on Cart title
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w(context),
                vertical: 8.h(context),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Products on Cart',
                  style: AppTextStyles.bold18(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ),
            ),
            // Cart Items List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 8.h(context)),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CartItemCard(product: products[index]);
                },
              ),
            ),
            // Bottom Bar
            CartBottomBar(
              itemCount: products.length,
              subtotal: cubit.subtotal,
            ),
          ],
        );
      },
    );
  }
}
