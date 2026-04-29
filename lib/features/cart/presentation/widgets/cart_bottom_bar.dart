import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_state.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';

class CartBottomBar extends StatelessWidget {
  final int itemCount;
  final double subtotal;

  const CartBottomBar({
    super.key,
    required this.itemCount,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          final profileCubit = context.read<ProfileCubit>();
          final cartCubit = context.read<CartCubit>();
          
          context.push(
            RoutePaths.checkout,
            extra: PaymentParams(
              cart: CartEntity(
                products: cartCubit.cartProducts,
                total: subtotal.toInt(),
                skip: 0,
                limit: 10,
              ),
              userProfile: profileCubit.userProfile!,
            ),
          );
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w(context),
            vertical: 16.h(context),
          ),
          decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r(context)),
              topRight: Radius.circular(24.r(context)),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal ($itemCount items)',
                      style: AppTextStyles.medium16(context).copyWith(
                        color: context.secondaryTextColor,
                      ),
                    ),
                    Text(
                      '${subtotal.toStringAsFixed(2)} EGP',
                      style: AppTextStyles.bold18(context).copyWith(
                        color: context.mainTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                CustomButton(
                  width: double.infinity,
                  borderRadius: 16.r(context),
                  onPressed: () {
                    final profileCubit = context.read<ProfileCubit>();
                    if (profileCubit.userProfile != null) {
                      final cartCubit = context.read<CartCubit>();
                      context.push(
                        RoutePaths.checkout,
                        extra: PaymentParams(
                          cart: CartEntity(
                            products: cartCubit.cartProducts,
                            total: subtotal.toInt(),
                            skip: 0,
                            limit: 10,
                          ),
                          userProfile: profileCubit.userProfile!,
                        ),
                      );
                    } else {
                      profileCubit.getUserData();
                    }
                  },
                  child: state is ProfileLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Checkout',
                          style: AppTextStyles.bold16(context).copyWith(
                            color: Colors.white,
                          ),
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
