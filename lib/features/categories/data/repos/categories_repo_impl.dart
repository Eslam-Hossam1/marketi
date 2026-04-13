import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/entities/category_entity.dart';
import '../datasources/categories_remote_data_source/categories_remote_data_source.dart';
import '../../domain/repos/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepoImpl(this._categoriesRemoteDataSource);

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await _categoriesRemoteDataSource.getCategories();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
