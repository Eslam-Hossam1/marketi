import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/failures.dart';
import 'package:nexcart/core/entities/products_entity.dart';
import 'package:nexcart/core/params/product_params.dart';

abstract class BrandProductsRepo {
  Future<Either<Failure, ProductsEntity>> getBrandProducts(ProductParams params);
}
