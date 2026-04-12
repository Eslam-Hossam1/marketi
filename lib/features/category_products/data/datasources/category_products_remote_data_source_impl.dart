import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/core/models/product_request_model.dart';
import 'package:marketi/core/models/products_response_model.dart';
import 'category_products_remote_data_source.dart';

class CategoryProductsRemoteDataSourceImpl implements CategoryProductsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CategoryProductsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductsResponseModel> getCategoryProducts(
      ProductRequestModel requestModel) async {
    final response = await _apiConsumer.get(
      EndPoints.categoryProductsPath(requestModel.category!),
      queryParameters: {
        'skip': requestModel.skip,
        'limit': requestModel.limit,
      },
    );
    return ProductsResponseModel.fromJson(response);
  }
}
