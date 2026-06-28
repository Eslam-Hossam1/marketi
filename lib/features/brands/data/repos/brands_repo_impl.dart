import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/entities/brand_entity.dart';
import '../datasources/brands_remote_data_source/brands_remote_data_source.dart';
import '../../domain/repos/brands_repo.dart';

class BrandsRepoImpl implements BrandsRepo {
  final BrandsRemoteDataSource _brandsRemoteDataSource;

  BrandsRepoImpl(this._brandsRemoteDataSource);

  @override
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands() async {
    try {
      final response = await _brandsRemoteDataSource.getBrands();
      return Right(response);
    } catch (e) {
      if (e is PostgrestException) {
        return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
      }
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
