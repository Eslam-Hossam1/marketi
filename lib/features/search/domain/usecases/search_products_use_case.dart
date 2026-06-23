import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/failures.dart';
import 'package:nexcart/core/entities/products_entity.dart';
import 'package:nexcart/core/params/product_params.dart';
import 'package:nexcart/core/usecases/use_case.dart';
import '../repos/search_repo.dart';

class SearchProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final SearchRepo _searchRepo;

  SearchProductsUseCase(this._searchRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _searchRepo.searchProducts(params);
  }
}
