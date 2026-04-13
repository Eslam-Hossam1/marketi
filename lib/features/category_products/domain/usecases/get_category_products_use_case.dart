import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/category_products_repo.dart';

class GetCategoryProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final CategoryProductsRepo _categoryProductsRepo;

  GetCategoryProductsUseCase(this._categoryProductsRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _categoryProductsRepo.getCategoryProducts(params);
  }
}
