import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/failures.dart';
import 'package:nexcart/core/errors/dio_api_failure.dart';
import 'package:nexcart/core/entities/products_entity.dart';
import 'package:nexcart/core/params/product_params.dart';
import 'package:nexcart/core/models/product_request_model.dart';
import 'package:nexcart/features/brand_products/domain/repos/brand_products_repo.dart';
import '../datasources/brand_products_remote_data_source.dart';

class BrandProductsRepoImpl implements BrandProductsRepo {
  final BrandProductsRemoteDataSource _remoteDataSource;

  BrandProductsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ProductsEntity>> getBrandProducts(ProductParams params) async {
    try {
      final result = await _remoteDataSource.getBrandProducts(
        ProductRequestModel.fromParams(params),
      );
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
