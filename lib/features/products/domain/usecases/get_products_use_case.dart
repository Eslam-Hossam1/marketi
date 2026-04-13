import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/products_repo.dart';

class GetProductsUseCase implements UseCase<ApiFailure, ProductsEntity, ProductParams> {
  final ProductsRepo _productsRepo;

  GetProductsUseCase(this._productsRepo);

  @override
  Future<Either<ApiFailure, ProductsEntity>> call(ProductParams params) {
    return _productsRepo.getProducts(params);
  }
}
