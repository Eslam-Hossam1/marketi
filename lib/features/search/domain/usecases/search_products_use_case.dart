import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/search_repo.dart';

class SearchProductsUseCase implements UseCase<Failure, ProductsEntity, ProductParams> {
  final SearchRepo _searchRepo;

  SearchProductsUseCase(this._searchRepo);

  @override
  Future<Either<Failure, ProductsEntity>> call(ProductParams params) {
    return _searchRepo.searchProducts(params);
  }
}
