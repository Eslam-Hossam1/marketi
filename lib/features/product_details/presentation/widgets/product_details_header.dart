import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/routing/routes_paths.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context), vertical: 8.h(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20.w(context),
                color: context.primaryColor,
              ),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              side: BorderSide(
                color: context.primaryColor.withValues(alpha: 0.2),
              ),
            ),
          ),
          Text(
            'Product Details',
            style: AppTextStyles.medium18(context).copyWith(color: context.mainTextColor),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {
                  context.push(RoutePaths.cart);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: context.primaryColor,
                  size: 24.w(context),
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue, // Primary color fallback if not using context
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3', // Dummy badge number
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
        ],
      ),
    );
  }
}
