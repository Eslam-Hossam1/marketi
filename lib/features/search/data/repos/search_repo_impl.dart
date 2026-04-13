import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/models/product_request_model.dart';
import '../datasources/search_remote_data_source/search_remote_data_source.dart';
import '../../domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepoImpl(this._searchRemoteDataSource);

  @override
  Future<Either<Failure, ProductsEntity>> searchProducts(ProductParams params) async {
    try {
      final requestModel = ProductRequestModel.fromParams(params);
      final response = await _searchRemoteDataSource.searchProducts(requestModel);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
