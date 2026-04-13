import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/brand_products_repo.dart';

class GetBrandProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final BrandProductsRepo _brandProductsRepo;

  GetBrandProductsUseCase(this._brandProductsRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _brandProductsRepo.getBrandProducts(params);
  }
}
