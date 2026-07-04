import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:nextcart/features/product_details/domain/params/product_details_params.dart';
import 'package:nextcart/core/routing/routing_helper.dart';

class FavoritesItemCard extends StatelessWidget {
  final ProductEntity product;

  const FavoritesItemCard({super.key, required this.product});

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
            color: Colors.red.withValues(alpha: 0.12),
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
                    maxLines: 2,
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
            // Remove Button
            BlocConsumer<FavoritesCubit, FavoritesState>(
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
                return GestureDetector(
                  onTap: () {
                    context
                        .read<FavoritesCubit>()
                        .toggleFavorite(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w(context)),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10.r(context)),
                    ),
                    child: Icon(
                      Icons.favorite_rounded,
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
