import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/product_request_model.dart';
import 'package:marketi/features/home/data/models/products_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BrandModel>> getBrands();
  Future<List<CategoryModel>> getCategories();
  Future<ProductsResponseModel> getProducts(ProductRequestModel requestModel);
}
