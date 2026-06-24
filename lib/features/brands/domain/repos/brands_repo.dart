import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/entities/brand_entity.dart';

abstract class BrandsRepo {
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands();
}
