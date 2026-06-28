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

  Future<void> addToFavorites(String productId) async {
    emit(AddToFavoritesLoading(productId: productId));
    final result = await _addToFavoritesUseCase(
      FavoriteProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(AddToFavoritesFailure(
        productId: productId,
        errorMessage: failure.errMsg,
      )),
      (_) async {
        _favoriteProductIds.add(productId);
        emit(AddToFavoritesSuccess(productId: productId));
        await getFavorites(showLoading: false);
      },
    );
  }

  Future<void> removeFromFavorites(String productId) async {
    emit(RemoveFromFavoritesLoading(productId: productId));
    final result = await _removeFromFavoritesUseCase(
      FavoriteProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(RemoveFromFavoritesFailure(
        productId: productId,
        errorMessage: failure.errMsg,
      )),
      (_) async {
        favoriteProducts.removeWhere((p) => p.id == productId);
        _favoriteProductIds.remove(productId);
        if (favoriteProducts.isEmpty) {
          emit(FavoritesEmpty());
        } else {
          emit(RemoveFromFavoritesSuccess(productId: productId));
        }
        await getFavorites(showLoading: false);
      },
    );
  }
}
