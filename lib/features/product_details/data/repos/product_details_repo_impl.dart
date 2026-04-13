import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
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
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
