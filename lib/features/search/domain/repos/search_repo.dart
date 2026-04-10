import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';

abstract class SearchRepo {
  Future<Either<Failure, ProductsEntity>> searchProducts(ProductParams params);
}
