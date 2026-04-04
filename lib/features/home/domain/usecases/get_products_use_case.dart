import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/home/domain/entities/products_entity.dart';
import 'package:marketi/features/home/domain/params/product_params.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

class GetProductsUseCase implements UseCase<ApiFailure, ProductsEntity, ProductParams> {
  final HomeRepo _homeRepo;

  GetProductsUseCase(this._homeRepo);

  @override
  Future<Either<ApiFailure, ProductsEntity>> call(ProductParams params) {
    return _homeRepo.getProducts(params);
  }
}
