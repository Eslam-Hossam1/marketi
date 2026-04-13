import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/entities/category_entity.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../repos/categories_repo.dart';

class GetCategoriesUseCase
    implements NoParamUseCase<ApiFailure, List<CategoryEntity>> {
  final CategoriesRepo _categoriesRepo;

  GetCategoriesUseCase(this._categoriesRepo);

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> call() {
    return _categoriesRepo.getCategories();
  }
}
