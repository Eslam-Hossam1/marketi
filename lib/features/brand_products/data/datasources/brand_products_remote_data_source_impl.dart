import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/core/models/product_request_model.dart';
import 'package:marketi/core/models/products_response_model.dart';
import 'brand_products_remote_data_source.dart';

class BrandProductsRemoteDataSourceImpl implements BrandProductsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  BrandProductsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductsResponseModel> getBrandProducts(
      ProductRequestModel requestModel) async {
    final response = await _apiConsumer.get(
      EndPoints.brandProductsPath(requestModel.brand!),
      queryParameters: {
        'skip': requestModel.skip,
        'limit': requestModel.limit,
      },
    );
    return ProductsResponseModel.fromJson(response);
  }
}
