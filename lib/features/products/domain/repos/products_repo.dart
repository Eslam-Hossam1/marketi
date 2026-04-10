import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';

abstract class ProductsRepo {
  Future<Either<ApiFailure, ProductsEntity>> getProducts(ProductParams params);
}
