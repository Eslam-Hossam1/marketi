import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';

class ProductAddToCartButton extends StatelessWidget {
  final ProductEntity product;
  const ProductAddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          (current is AddToCartLoading && current.productId == product.id) ||
          (current is AddToCartSuccess && current.productId == product.id) ||
          (current is AddToCartFailure && current.productId == product.id) ||
          (current is RemoveFromCartLoading &&
              current.productId == product.id) ||
          (current is RemoveFromCartSuccess &&
              current.productId == product.id) ||
          (current is RemoveFromCartFailure &&
              current.productId == product.id) ||
          current is CartSuccess,
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final isInCart = cartCubit.isInCart(product.id);
        final isLoading =
            (state is AddToCartLoading && state.productId == product.id) ||
                (state is RemoveFromCartLoading &&
                    state.productId == product.id);

        return SizedBox(
          width: double.infinity,
          height: 38.h(context),
          child: TextButton(
            onPressed: isLoading
                ? null
                : () {
                    if (isInCart) {
                      cartCubit.removeFromCart(product.id);
                    } else {
                      cartCubit.addToCart(product.id);
                    }
                  },
            style: TextButton.styleFrom(
              backgroundColor: isInCart
                  ? Colors.green.withValues(alpha: 0.1)
                  : context.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.zero,
            ),
            child: isLoading
                ? SizedBox(
                    width: 18.w(context),
                    height: 18.w(context),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: isInCart ? Colors.green : Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isInCart
                            ? Icons.check_circle_outline_rounded
                            : Icons.add_shopping_cart_rounded,
                        size: 18.w(context),
                        color: isInCart ? Colors.green : Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isInCart ? "In Cart" : "Add to Cart",
                        style: AppTextStyles.bold13(
                          context,
                        ).copyWith(
                          color: isInCart ? Colors.green : Colors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
