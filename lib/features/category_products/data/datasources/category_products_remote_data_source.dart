import 'package:nexcart/core/models/products_response_model.dart';
import 'package:nexcart/core/models/product_request_model.dart';

abstract class CategoryProductsRemoteDataSource {
  Future<ProductsResponseModel> getCategoryProducts(ProductRequestModel requestModel);
}
