import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories();
}
