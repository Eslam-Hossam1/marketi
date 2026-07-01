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
  ) : super(FavoritesInitial());

  List<ProductEntity> favoriteProducts = [];
  final Set<String> _favoriteProductIds = {};

  bool isInFavorites(String productId) =>
      _favoriteProductIds.contains(productId);

  Future<void> getFavorites({bool showLoading = true}) async {
    if (showLoading) emit(FavoritesLoading());
    final result = await _getFavoritesUseCase();
    result.fold(
      (failure) {
        if (showLoading) {
          emit(FavoritesFailure(errorMessage: failure.errMsg));
        }
      },
      (favoritesEntity) {
        favoriteProducts = List.from(favoritesEntity.products);
        _favoriteProductIds
          ..clear()
          ..addAll(favoriteProducts.map((e) => e.id));

        if (favoriteProducts.isEmpty) {
          emit(FavoritesEmpty());
        } else {
          emit(FavoritesSuccess());
        }
      },
    );
  }

  Future<void> addToFavorites(ProductEntity product) async {
    // Optimistic Update
    _favoriteProductIds.add(product.id);
    favoriteProducts.add(product);
    emit(AddToFavoritesSuccess(productId: product.id));

    final result = await _addToFavoritesUseCase(
      FavoriteProductParams(productId: product.id),
    );
    
    result.fold(
      (failure) {
        // Revert Optimistic Update
        _favoriteProductIds.remove(product.id);
        favoriteProducts.removeWhere((p) => p.id == product.id);
        emit(AddToFavoritesFailure(
          productId: product.id,
          errorMessage: failure.errMsg,
        ));
      },
      (_) async {
        // The API call was successful.
      },
    );
  }

  Future<void> removeFromFavorites(ProductEntity product) async {
    // Optimistic Update
    _favoriteProductIds.remove(product.id);
    final int index = favoriteProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      favoriteProducts.removeAt(index);
    }
    
    emit(RemoveFromFavoritesSuccess(productId: product.id));

    if (favoriteProducts.isEmpty) {
      emit(FavoritesEmpty());
    }

    final result = await _removeFromFavoritesUseCase(
      FavoriteProductParams(productId: product.id),
    );
    
    result.fold(
      (failure) {
        // Revert Optimistic Update
        _favoriteProductIds.add(product.id);
        if (index != -1) {
          favoriteProducts.insert(index, product);
        } else {
          favoriteProducts.add(product);
        }
        
        emit(RemoveFromFavoritesFailure(
          productId: product.id,
          errorMessage: failure.errMsg,
        ));
      },
      (_) async {
        // Success.
      },
    );
  }
}
