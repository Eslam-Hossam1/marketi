import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';

class ProductAddToCartButton extends StatelessWidget {
  final ProductEntity product;
  const ProductAddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          (current is AddToCartFailure && current.productId == product.id),
      listener: (context, state) {
        if (state is AddToCartFailure && state.productId == product.id) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
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
          current is GetCartSuccess ||
          current is CartCleared,
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final isInCart = cartCubit.isInCart(product.id);
        final isLoading =
            (state is AddToCartLoading && state.productId == product.id) ||
            (state is RemoveFromCartLoading && state.productId == product.id);

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
                      cartCubit.addToCart(product);
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
                        style: AppTextStyles.bold13(context).copyWith(
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
