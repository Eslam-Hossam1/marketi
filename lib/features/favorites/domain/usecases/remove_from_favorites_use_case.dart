import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../params/favorite_product_params.dart';
import '../repos/favorites_repo.dart';

class RemoveFromFavoritesUseCase
    implements UseCase<ApiFailure, void, FavoriteProductParams> {
  final FavoritesRepo _favoritesRepo;

  RemoveFromFavoritesUseCase(this._favoritesRepo);

  @override
  Future<Either<ApiFailure, void>> call(FavoriteProductParams params) {
    return _favoritesRepo.removeFromFavorites(params);
  }
}
