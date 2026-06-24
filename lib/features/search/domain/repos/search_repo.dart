import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';

abstract class SearchRepo {
  Future<Either<Failure, ProductsEntity>> searchProducts(ProductParams params);
}
