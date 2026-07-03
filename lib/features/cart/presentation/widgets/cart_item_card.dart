import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:nextcart/core/routing/routing_helper.dart';

class CartItemCard extends StatelessWidget {
  final ProductEntity product;

  const CartItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingHelper.pushProductDetails(context, productId: product.id);
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
                    product.category?.name ?? '',
                    style: AppTextStyles.regular12(context).copyWith(
                      color: context.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 8.h(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '${product.price.toStringAsFixed(2)} EGP',
                        style: AppTextStyles.bold14(context).copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                      // Quantity Stepper
                      _QuantityStepper(productId: product.id),
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

class _QuantityStepper extends StatelessWidget {
  final String productId;

  const _QuantityStepper({required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          (current is UpdateCartQuantityLoading &&
              current.productId == productId) ||
          (current is UpdateCartQuantitySuccess &&
              current.productId == productId) ||
          (current is UpdateCartQuantityFailure &&
              current.productId == productId),
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final quantity = cubit.getQuantity(productId);
        final isLoading = state is UpdateCartQuantityLoading &&
            state.productId == productId;

        return Container(
          decoration: BoxDecoration(
            color: context.primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10.r(context)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrement button
              _StepperButton(
                icon: quantity <= 1
                    ? Icons.delete_outline_rounded
                    : Icons.remove_rounded,
                iconColor: quantity <= 1 ? Colors.red : context.primaryColor,
                onTap: isLoading
                    ? null
                    : () => cubit.updateQuantity(productId, quantity - 1),
              ),
              // Quantity display
              SizedBox(
                width: 28.w(context),
                child: isLoading
                    ? Center(
                        child: SizedBox(
                          width: 14.w(context),
                          height: 14.w(context),
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            color: context.primaryColor,
                          ),
                        ),
                      )
                    : Text(
                        '$quantity',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold14(context).copyWith(
                          color: context.mainTextColor,
                        ),
                      ),
              ),
              // Increment button
              _StepperButton(
                icon: Icons.add_rounded,
                iconColor: context.primaryColor,
                onTap: isLoading
                    ? null
                    : () => cubit.updateQuantity(productId, quantity + 1),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const _StepperButton({
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w(context),
          vertical: 6.h(context),
        ),
        child: Icon(
          icon,
          size: 18.w(context),
          color: onTap == null
              ? iconColor.withValues(alpha: 0.4)
              : iconColor,
        ),
      ),
    );
  }
}
