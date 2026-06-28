import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/entities/category_entity.dart';
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
      if (e is PostgrestException) {
        return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
      }
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
