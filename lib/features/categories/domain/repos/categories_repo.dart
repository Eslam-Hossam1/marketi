import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories();
}
