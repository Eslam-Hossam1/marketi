import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/entities/brand_entity.dart';

abstract class BrandsRepo {
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands();
}
