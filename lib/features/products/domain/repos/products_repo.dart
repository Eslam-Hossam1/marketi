import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/entities/products_entity.dart';
import 'package:nexcart/core/params/product_params.dart';

abstract class ProductsRepo {
  Future<Either<ApiFailure, ProductsEntity>> getProducts(ProductParams params);
}
