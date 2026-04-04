import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/products_entity.dart';
import 'package:marketi/features/home/domain/params/product_params.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, List<BrandEntity>>> getBrands();
  Future<Either<ApiFailure, List<CategoryEntity>>> getCategories();
  Future<Either<ApiFailure, ProductsEntity>> getProducts(ProductParams params);
}
