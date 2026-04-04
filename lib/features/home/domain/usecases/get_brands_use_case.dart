import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

class GetBrandsUseCase implements NoParamUseCase<ApiFailure, List<BrandEntity>> {
  final HomeRepo _homeRepo;

  GetBrandsUseCase(this._homeRepo);

  @override
  Future<Either<ApiFailure, List<BrandEntity>>> call() {
    return _homeRepo.getBrands();
  }
}
