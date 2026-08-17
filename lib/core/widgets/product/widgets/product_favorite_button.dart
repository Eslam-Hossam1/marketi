import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductFavoriteButton extends StatelessWidget {
  final ProductEntity product;

  const ProductFavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
