import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCardImage extends StatelessWidget {
  final ProductEntity product;
  final Color? badgeColor;

  const ProductCardImage({
    super.key,
    required this.product,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedNetworkImage(
                url: product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Discount Badge
          if (product.discountPercentage > 0)
            Positioned(
              top: 0,
              left: 0,
              child: Skeleton.ignore(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor ?? context.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "${product.discountPercentage.toInt()}% OFF",
                    style: AppTextStyles.medium12(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.w(context),
                    ),
                  ),
                ),
              ),
            ),
          // Favorite Icon Button
          Positioned(
            top: 8,
            right: 8,
            child: Skeleton.ignore(
              child: BlocConsumer<FavoritesCubit, FavoritesState>(
                buildWhen: (previous, current) =>
                    current is FavoritesSuccess ||
                    current is FavoritesEmpty ||
                    (current is FavoriteToggled &&
                        current.productId == product.id) ||
                    (current is FavoriteToggleReverted &&
                        current.productId == product.id),
                listenWhen: (previous, current) =>
                    current is FavoriteToggleReverted &&
                    current.productId == product.id,
                listener: (context, state) {
                  if (state is FavoriteToggleReverted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final favoritesCubit = context.read<FavoritesCubit>();
                  final isInFavorites = favoritesCubit.isInFavorites(product.id);
              
                  return GestureDetector(
                    onTap: () => favoritesCubit.toggleFavorite(product),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        isInFavorites
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 18.w(context),
                        color: isInFavorites ? Colors.red : context.mainTextColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
