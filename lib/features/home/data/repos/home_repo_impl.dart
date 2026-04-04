import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/products_entity.dart';
import 'package:marketi/features/home/domain/params/product_params.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl({required HomeRemoteDataSource homeRemoteDataSource})
      : _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands() async {
    try {
      final brands = await _homeRemoteDataSource.getBrands();
      return Right(brands);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await _homeRemoteDataSource.getCategories();
      return Right(categories);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, ProductsEntity>> getProducts(
      ProductParams params) async {
    try {
      final productsResponse = await _homeRemoteDataSource.getProducts(params);
      return Right(productsResponse);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
