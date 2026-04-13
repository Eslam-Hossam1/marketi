import 'package:marketi/core/models/products_response_model.dart';
import 'package:marketi/core/models/product_request_model.dart';

abstract class BrandProductsRemoteDataSource {
  Future<ProductsResponseModel> getBrandProducts(ProductRequestModel requestModel);
}
