import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories();
}
