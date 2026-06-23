import 'package:nexcart/core/networking/api_consumer.dart';
import 'package:nexcart/core/networking/end_points.dart';
import 'package:nexcart/core/models/product_request_model.dart';
import 'package:nexcart/core/models/products_response_model.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer _apiConsumer;

  SearchRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductsResponseModel> searchProducts(
      ProductRequestModel requestModel) async {
    final response = await _apiConsumer.post(
      EndPoints.productsFilter,
      data: requestModel.toJson(),
    );
    return ProductsResponseModel.fromJson(response);
  }
}
