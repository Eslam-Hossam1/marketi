import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/features/favorites/domain/params/favorite_product_params.dart';
import 'package:nextcart/features/favorites/domain/usecases/add_to_favorites_use_case.dart';
import 'package:nextcart/features/favorites/domain/usecases/get_favorites_use_case.dart';
import 'package:nextcart/features/favorites/domain/usecases/remove_from_favorites_use_case.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  FavoritesCubit(
    this._getFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(const FavoritesInitial());

  List<ProductEntity> _favoriteProducts = [];
  final Set<String> _favoriteProductIds = {};

  /// Unmodifiable view of the current favorites list.
  List<ProductEntity> get favorites => List.unmodifiable(_favoriteProducts);

  bool isInFavorites(String productId) =>
      _favoriteProductIds.contains(productId);

  Future<void> getFavorites({bool showLoading = true}) async {
    if (showLoading) emit(const FavoritesLoading());

    final result = await _getFavoritesUseCase();

    result.fold(
      (failure) => emit(FavoritesFailure(errorMessage: failure.errMsg)),
      (favoritesEntity) {
        _favoriteProducts = List.from(favoritesEntity.products);
        _favoriteProductIds
          ..clear()
          ..addAll(_favoriteProducts.map((e) => e.id));

        if (_favoriteProducts.isEmpty) {
          emit(const FavoritesEmpty());
        } else {
          emit(const FavoritesSuccess());
        }
      },
    );
  }

  /// Toggles the favorite status of [product] with an optimistic UI update.
  ///
  /// If the API call fails, the local state is rolled back and
  /// [FavoriteToggleReverted] is emitted so the UI can show an error.
  Future<void> toggleFavorite(ProductEntity product) async {
    final bool wasFavorite = isInFavorites(product.id);
    final int index =
        _favoriteProducts.indexWhere((p) => p.id == product.id);

    // 1. Optimistic update — mutate local state before the API call.
    if (wasFavorite) {
      _favoriteProductIds.remove(product.id);
      if (index != -1) _favoriteProducts.removeAt(index);
    } else {
      _favoriteProductIds.add(product.id);
      _favoriteProducts.add(product);
    }
    emit(FavoriteToggled(productId: product.id, isFavorite: !wasFavorite));

    // 2. Fire the correct use case based on previous state.
    final result = wasFavorite
        ? await _removeFromFavoritesUseCase(
            FavoriteProductParams(productId: product.id),
          )
        : await _addToFavoritesUseCase(
            FavoriteProductParams(productId: product.id),
          );

    result.fold(
      (failure) {
        // 3. Rollback on failure — restore the original local state.
        if (wasFavorite) {
          _favoriteProductIds.add(product.id);
          if (index != -1) {
            _favoriteProducts.insert(index, product);
          } else {
            _favoriteProducts.add(product);
          }
        } else {
          _favoriteProductIds.remove(product.id);
          _favoriteProducts.removeWhere((p) => p.id == product.id);
        }
        emit(FavoriteToggleReverted(
          productId: product.id,
          isFavorite: wasFavorite,
          errorMessage: failure.errMsg,
        ));
      },
      (_) {
        // 4. On successful removal, show empty state if the list is now empty.
        if (wasFavorite && _favoriteProducts.isEmpty) {
          emit(const FavoritesEmpty());
        }
      },
    );
  }
}
