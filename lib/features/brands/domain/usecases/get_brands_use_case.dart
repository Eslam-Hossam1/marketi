import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/entities/brand_entity.dart';
import 'package:nexcart/core/usecases/use_case.dart';
import '../repos/brands_repo.dart';

class GetBrandsUseCase implements NoParamUseCase<ApiFailure, List<BrandEntity>> {
  final BrandsRepo _brandsRepo;

  GetBrandsUseCase(this._brandsRepo);

  @override
  Future<Either<ApiFailure, List<BrandEntity>>> call() {
    return _brandsRepo.getBrands();
  }
}
