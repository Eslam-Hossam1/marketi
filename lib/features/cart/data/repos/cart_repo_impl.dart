import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import '../datasources/cart_remote_data_source/cart_remote_data_source.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/params/cart_product_params.dart';
import '../../domain/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepoImpl(this._cartRemoteDataSource);

  @override
  Future<Either<ApiFailure, CartEntity>> getCart() async {
    try {
      final response = await _cartRemoteDataSource.getCart();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, void>> addToCart(CartProductParams params) async {
    try {
      await _cartRemoteDataSource.addToCart(params.productId.toString());
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, void>> removeFromCart(
      CartProductParams params) async {
    try {
      await _cartRemoteDataSource.removeFromCart(params.productId.toString());
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
