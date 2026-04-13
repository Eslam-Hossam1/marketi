import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/entities/brand_entity.dart';
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
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
