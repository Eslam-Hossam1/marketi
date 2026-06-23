import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/failures.dart';
import '../entities/product_details_entity.dart';
import '../params/product_details_params.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
      ProductDetailsParams params);
}
