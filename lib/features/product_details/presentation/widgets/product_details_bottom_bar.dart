import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final double price;
  final int productId;
  const ProductDetailsBottomBar({
    super.key,
    required this.price,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: AppTextStyles.semiBold18(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
            Text(
              '${price.toStringAsFixed(2)} EGP',
              style: AppTextStyles.bold20(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              (current is AddToCartLoading && current.productId == productId) ||
              (current is AddToCartSuccess && current.productId == productId) ||
              (current is AddToCartFailure && current.productId == productId) ||
              (current is RemoveFromCartLoading &&
                  current.productId == productId) ||
              (current is RemoveFromCartSuccess &&
                  current.productId == productId) ||
              (current is RemoveFromCartFailure &&
                  current.productId == productId) ||
              current is CartSuccess,
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();
            final isInCart = cartCubit.isInCart(productId);
            final isLoading = (state is AddToCartLoading &&
                    state.productId == productId) ||
                (state is RemoveFromCartLoading &&
                    state.productId == productId);

            return CustomButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (isInCart) {
                        cartCubit.removeFromCart(productId);
                      } else {
                        cartCubit.addToCart(productId);
                      }
                    },
              width: 200.w(context),
              borderRadius: 16.r(context),
              backgroundColor: isInCart ? Colors.green : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    SizedBox(
                      width: 20.w(context),
                      height: 20.w(context),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  else ...[
                    Icon(
                      isInCart ? Icons.check : Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 20.w(context),
                    ),
                    const WidthSpace(width: 8),
                    Text(
                      isInCart ? 'In Cart' : 'Add to Cart',
                      style: AppTextStyles.medium16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

