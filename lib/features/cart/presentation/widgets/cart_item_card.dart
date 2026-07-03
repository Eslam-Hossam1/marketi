import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/domain/entities/cart_item_entity.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:nextcart/core/routing/routing_helper.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushProductDetails(
          context,
          productId: cartItem.product.id,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r(context)),
              child: SizedBox(
                width: 105.w(context),
                height: 105.h(context),
                child: CustomCachedNetworkImage(
                  url: cartItem.product.thumbnail,
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
                  // Title
                  Text(
                    cartItem.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bold14(
                      context,
                    ).copyWith(color: context.mainTextColor),
                  ),
                  SizedBox(height: 4.h(context)),
                  // Category
                  Text(
                    cartItem.product.category?.name ?? '',
                    style: AppTextStyles.regular12(
                      context,
                    ).copyWith(color: context.secondaryTextColor),
                  ),
                  SizedBox(height: 8.h(context)),
                  // Price + Rating row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: ${cartItem.product.price.toStringAsFixed(2)} EGP',
                        style: AppTextStyles.bold14(
                          context,
                        ).copyWith(color: context.mainTextColor),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 14.w(context),
                            color: const Color(0xFFFFA726),
                          ),
                          SizedBox(width: 2.w(context)),
                          Text(
                            cartItem.product.rating.toStringAsFixed(1),
                            style: AppTextStyles.regular12(
                              context,
                            ).copyWith(color: context.secondaryTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h(context)),
                  // Stepper — below price, inside info column
                  _QuantityStepper(productId: cartItem.product.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final String productId;

  const _QuantityStepper({required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          (current is UpdateCartQuantitySuccess &&
              current.productId == productId) ||
          (current is UpdateCartQuantityFailure &&
              current.productId == productId) ||
          (current is RemoveFromCartLoading &&
              current.productId == productId) ||
          (current is RemoveFromCartSuccess &&
              current.productId == productId) ||
          (current is RemoveFromCartFailure && current.productId == productId),
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final quantity = cubit.getQuantity(productId);
        final isRemoving =
            state is RemoveFromCartLoading && state.productId == productId;

        return Row(
          children: [
            // Decrement / Delete button
            _StepperButton(
              isRound: false,
              isDelete: quantity <= 1,
              isLoading: isRemoving,
              icon: quantity <= 1
                  ? Icons.delete_outline_rounded
                  : Icons.remove_rounded,
              onTap: isRemoving
                  ? null
                  : () => cubit.updateQuantity(productId, quantity - 1),
            ),
            // Quantity display — always shows the live optimistic value.
            Expanded(
              child: Center(
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold16(
                    context,
                  ).copyWith(color: context.mainTextColor),
                ),
              ),
            ),
            // Increment button
            _StepperButton(
              isRound: false,
              isDelete: false,
              icon: Icons.add_rounded,
              isLoading: false,
              onTap: isRemoving
                  ? null
                  : () => cubit.updateQuantity(productId, quantity + 1),
            ),
          ],
        );
      },
    );
  }
}

class _StepperButton extends StatelessWidget {
  final bool isDelete;
  final bool isRound;
  final bool isLoading;
  final IconData icon;
  final VoidCallback? onTap;

  const _StepperButton({
    required this.isDelete,
    required this.isRound,
    required this.isLoading,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDelete
        ? Colors.red.withValues(alpha: 0.12)
        : context.primaryColor.withValues(alpha: 0.12);
    final iconColor = isDelete ? Colors.red : context.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w(context),
        height: 36.h(context),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            isRound ? 18.r(context) : 10.r(context),
          ),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 16.w(context),
                  height: 16.w(context),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: iconColor,
                  ),
                ),
              )
            : Icon(
                icon,
                size: 20.w(context),
                color: onTap == null
                    ? iconColor.withValues(alpha: 0.4)
                    : iconColor,
              ),
      ),
    );
  }
}
