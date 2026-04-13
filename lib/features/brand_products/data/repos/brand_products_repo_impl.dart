import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/entities/products_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/models/product_request_model.dart';
import 'package:marketi/features/brand_products/domain/repos/brand_products_repo.dart';
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
