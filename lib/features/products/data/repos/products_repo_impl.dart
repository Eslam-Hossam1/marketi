import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/core/models/product_request_model.dart';
import '../datasources/products_remote_data_source/products_remote_data_source.dart';
import '../../domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<Either<ApiFailure, ProductsEntity>> getProducts(ProductParams params) async {
    try {
      final requestModel = ProductRequestModel.fromParams(params);
      final response = await _productsRemoteDataSource.getProducts(requestModel);
      return Right(response);
    } catch (e) {
      if (e is PostgrestException) {
        return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
      }
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
