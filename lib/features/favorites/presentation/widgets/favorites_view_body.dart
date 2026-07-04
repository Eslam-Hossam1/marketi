import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'favorites_item_card.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) =>
          current is FavoritesSuccess ||
          current is FavoriteToggled ||
          current is FavoriteToggleReverted ||
          current is FavoritesEmpty,
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final products = cubit.favorites;

        return Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w(context),
                vertical: 12.h(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Favorites',
                    style: AppTextStyles.bold20(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ],
              ),
            ),
            // Count
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w(context),
                vertical: 4.h(context),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${products.length} ${products.length == 1 ? 'item' : 'items'} saved',
                  style: AppTextStyles.regular14(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
              ),
            ),
            // Products List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 4.h(context),
                  bottom: 20.h(context),
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FavoritesItemCard(product: products[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
