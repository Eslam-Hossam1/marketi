import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/models/product_request_model.dart';
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
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
