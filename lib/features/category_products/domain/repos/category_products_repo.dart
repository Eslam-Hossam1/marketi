import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';

abstract class CategoryProductsRepo {
  Future<Either<Failure, ProductsEntity>> getCategoryProducts(ProductParams params);
}
