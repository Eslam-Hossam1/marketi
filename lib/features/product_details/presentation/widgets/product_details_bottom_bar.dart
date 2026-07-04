import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';
import 'package:nextcart/core/widgets/spacing/width_space.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:nextcart/core/entities/product_entity.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final ProductEntity product;
  
  const ProductDetailsBottomBar({
    super.key,
    required this.product,
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
              '${product.price.toStringAsFixed(2)} EGP',
              style: AppTextStyles.bold20(
                context,
              ).copyWith(color: context.mainTextColor),
            ),
          ],
        ),
        BlocBuilder<CartCubit, CartState>(
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

            return CustomButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (isInCart) {
                        cartCubit.removeFromCart(product.id);
                      } else {
                        cartCubit.addToCart(product);
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
