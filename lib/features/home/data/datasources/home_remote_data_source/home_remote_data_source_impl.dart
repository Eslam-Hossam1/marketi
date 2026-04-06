import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/product_request_model.dart';
import 'package:marketi/features/home/data/models/products_response_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _apiConsumer.get(EndPoints.brands);
    return (response['list'] as List)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(EndPoints.categories);
    return (response['list'] as List)
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

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
