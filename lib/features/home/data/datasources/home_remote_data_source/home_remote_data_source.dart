import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/products_response_model.dart';
import 'package:marketi/features/home/domain/params/product_params.dart';

abstract class HomeRemoteDataSource {
  Future<List<BrandModel>> getBrands();
  Future<List<CategoryModel>> getCategories();
  Future<ProductsResponseModel> getProducts(ProductParams params);
}
