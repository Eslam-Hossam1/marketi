import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCount = context.select<CartCubit, int>(
      (cubit) => cubit.cartItems.length,
    );

    return IconButton(
      onPressed: () => RoutingHelper.goCart(context),
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: context.primaryColor,
            size: 24.w(context),
          ),
          if (cartCount > 0)
            Positioned(
              top: -8.h(context),
              right: -4.w(context),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors
                      .blue, // Primary color fallback if not using context
                  shape: BoxShape.circle,
                ),
                child: Text(
                  cartCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.w(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
