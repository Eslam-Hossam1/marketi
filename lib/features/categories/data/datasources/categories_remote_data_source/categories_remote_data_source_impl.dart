import 'package:nexcart/core/networking/api_consumer.dart';
import 'package:nexcart/core/networking/end_points.dart';
import 'package:nexcart/core/models/category_model.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CategoriesRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(EndPoints.categories);
    return (response['list'] as List)
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
