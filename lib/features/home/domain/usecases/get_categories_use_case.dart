import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

class GetCategoriesUseCase implements NoParamUseCase<ApiFailure, List<CategoryEntity>> {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> call() {
    return _homeRepo.getCategories();
  }
}
