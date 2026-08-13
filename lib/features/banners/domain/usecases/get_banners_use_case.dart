import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';
import 'package:nextcart/features/banners/domain/repos/banners_repo.dart';

class GetBannersUseCase implements NoParamUseCase<ApiFailure, List<BannerEntity>> {
  final BannersRepo _bannersRepo;

  GetBannersUseCase(this._bannersRepo);

  @override
  Future<Either<ApiFailure, List<BannerEntity>>> call() {
    return _bannersRepo.getBanners();
  }
}
