import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../entities/favorites_entity.dart';
import '../repos/favorites_repo.dart';

class GetFavoritesUseCase implements NoParamUseCase<ApiFailure, FavoritesEntity> {
  final FavoritesRepo _favoritesRepo;

  GetFavoritesUseCase(this._favoritesRepo);

  @override
  Future<Either<ApiFailure, FavoritesEntity>> call() {
    return _favoritesRepo.getFavorites();
  }
}
