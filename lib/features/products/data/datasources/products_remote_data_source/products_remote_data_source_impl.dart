import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/core/models/product_request_model.dart';
import 'package:marketi/core/models/products_response_model.dart';
import 'products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductsResponseModel> getProducts(
      ProductRequestModel requestModel) async {
    final response = await _apiConsumer.get(
      EndPoints.products,
      queryParameters: requestModel.toJson(),
    );
    return ProductsResponseModel.fromJson(response);
  }
}
