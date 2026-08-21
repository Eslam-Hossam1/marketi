import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';

abstract class CategoryProductsRepo {
  Future<Either<Failure, ProductsEntity>> getCategoryProducts(ProductParams params);
}
