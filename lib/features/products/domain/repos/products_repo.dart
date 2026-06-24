import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';

abstract class ProductsRepo {
  Future<Either<ApiFailure, ProductsEntity>> getProducts(ProductParams params);
}
