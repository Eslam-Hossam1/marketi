import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';

class ProductCardInfo extends StatelessWidget {
  final ProductEntity product;
  final bool hasAddButton;

  const ProductCardInfo({
    super.key,
    required this.product,
    required this.hasAddButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price and Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.price.toInt()} LE",
                style: AppTextStyles.bold14(
                  context,
                ).copyWith(color: context.mainTextColor),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 18.w(context),
                    color: context.mainTextColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.rating.toString(),
                    style: AppTextStyles.medium14(
                      context,
                    ).copyWith(color: context.mainTextColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Title
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bold14(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          if (hasAddButton) ...[
            const SizedBox(height: 10),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  (current is AddToCartLoading &&
                      current.productId == product.id) ||
                  (current is AddToCartSuccess &&
                      current.productId == product.id) ||
                  (current is AddToCartFailure &&
                      current.productId == product.id) ||
                  current is CartSuccess,
              builder: (context, state) {
                final cartCubit = context.read<CartCubit>();
                final isInCart = cartCubit.isInCart(product.id);
                final isLoading = state is AddToCartLoading &&
                    state.productId == product.id;

                return SizedBox(
                  width: double.infinity,
                  height: 36.h(context),
                  child: OutlinedButton(
                    onPressed: isLoading || isInCart
                        ? null
                        : () => cartCubit.addToCart(product.id),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: isInCart
                            ? Colors.green
                            : context.primaryColor,
                      ),
                      backgroundColor: isInCart
                          ? Colors.green.withValues(alpha: 0.1)
                          : null,
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
                              color: context.primaryColor,
                            ),
                          )
                        : Text(
                            isInCart ? "In Cart" : "Add",
                            style: AppTextStyles.bold14(
                              context,
                            ).copyWith(
                              color: isInCart
                                  ? Colors.green
                                  : context.primaryColor,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
