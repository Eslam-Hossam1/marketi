import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import '../entities/favorites_entity.dart';
import '../params/favorite_product_params.dart';

abstract class FavoritesRepo {
  Future<Either<ApiFailure, FavoritesEntity>> getFavorites();
  Future<Either<ApiFailure, void>> addToFavorites(FavoriteProductParams params);
  Future<Either<ApiFailure, void>> removeFromFavorites(FavoriteProductParams params);
}
