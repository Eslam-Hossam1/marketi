import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi/features/product_details/domain/params/product_details_params.dart';
import 'package:marketi/core/routing/routing_helper.dart';

class CartItemCard extends StatelessWidget {
  final ProductEntity product;

  const CartItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushProductDetails(
          context,
          params: ProductDetailsRoutingParams(productId: product.id),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w(context),
          vertical: 6.h(context),
        ),
        padding: EdgeInsets.all(12.w(context)),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16.r(context)),
          border: Border.all(
            color: context.primaryColor.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r(context)),
              child: SizedBox(
                width: 90.w(context),
                height: 90.h(context),
                child: CustomCachedNetworkImage(
                  url: product.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w(context)),
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bold14(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                  SizedBox(height: 4.h(context)),
                  Text(
                    product.category,
                    style: AppTextStyles.regular12(context).copyWith(
                      color: context.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 8.h(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(2)} EGP',
                        style: AppTextStyles.bold14(context).copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 16.w(context),
                            color: Colors.amber,
                          ),
                          SizedBox(width: 2.w(context)),
                          Text(
                            product.rating.toString(),
                            style: AppTextStyles.medium12(context).copyWith(
                              color: context.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w(context)),
            // Delete Button
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  (current is RemoveFromCartLoading &&
                      current.productId == product.id) ||
                  (current is RemoveFromCartSuccess &&
                      current.productId == product.id) ||
                  (current is RemoveFromCartFailure &&
                      current.productId == product.id),
              builder: (context, state) {
                final isRemoving = state is RemoveFromCartLoading &&
                    state.productId == product.id;

                return GestureDetector(
                  onTap: isRemoving
                      ? null
                      : () {
                          context
                              .read<CartCubit>()
                              .removeFromCart(product.id);
                        },
                  child: Container(
                    padding: EdgeInsets.all(8.w(context)),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10.r(context)),
                    ),
                    child: isRemoving
                        ? SizedBox(
                            width: 20.w(context),
                            height: 20.w(context),
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red,
                            ),
                          )
                        : Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                            size: 20.w(context),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
