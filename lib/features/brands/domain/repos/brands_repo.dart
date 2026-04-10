import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/brand_entity.dart';

abstract class BrandsRepo {
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands();
}
