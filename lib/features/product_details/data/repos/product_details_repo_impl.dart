import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import '../../domain/entities/product_details_entity.dart';
import '../../domain/params/product_details_params.dart';
import '../../domain/repos/product_details_repo.dart';
import '../datasources/product_details_remote_data_source.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource _remoteDataSource;

  ProductDetailsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(ProductDetailsParams params) async {
    try {
      final response = await _remoteDataSource.getProductDetails(params);
      return Right(response);
    } catch (e) {
      if (e is PostgrestException) {
        return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
      }
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
