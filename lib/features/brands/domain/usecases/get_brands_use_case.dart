import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/brand_entity.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/brands_repo.dart';

class GetBrandsUseCase implements NoParamUseCase<ApiFailure, List<BrandEntity>> {
  final BrandsRepo _brandsRepo;

  GetBrandsUseCase(this._brandsRepo);

  @override
  Future<Either<ApiFailure, List<BrandEntity>>> call() {
    return _brandsRepo.getBrands();
  }
}
