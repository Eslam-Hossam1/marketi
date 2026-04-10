import 'package:marketi/core/models/product_request_model.dart';
import 'package:marketi/core/models/products_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsResponseModel> getProducts(ProductRequestModel requestModel);
}
