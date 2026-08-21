import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../repos/category_products_repo.dart';

class GetCategoryProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final CategoryProductsRepo _categoryProductsRepo;

  GetCategoryProductsUseCase(this._categoryProductsRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _categoryProductsRepo.getCategoryProducts(params);
  }
}
