import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/entities/products_entity.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/core/models/product_request_model.dart';
import 'package:nextcart/features/category_products/domain/repos/category_products_repo.dart';
import '../datasources/category_products_remote_data_source.dart';

class CategoryProductsRepoImpl implements CategoryProductsRepo {
  final CategoryProductsRemoteDataSource _remoteDataSource;

  CategoryProductsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ProductsEntity>> getCategoryProducts(ProductParams params) async {
    try {
      final result = await _remoteDataSource.getCategoryProducts(
        ProductRequestModel.fromParams(params),
      );
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
