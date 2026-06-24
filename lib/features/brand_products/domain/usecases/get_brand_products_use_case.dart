import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../repos/brand_products_repo.dart';

class GetBrandProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final BrandProductsRepo _brandProductsRepo;

  GetBrandProductsUseCase(this._brandProductsRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _brandProductsRepo.getBrandProducts(params);
  }
}
