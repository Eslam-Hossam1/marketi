import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/core/models/brand_model.dart';
import 'brands_remote_data_source.dart';

class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  BrandsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _apiConsumer.get(EndPoints.brands);
    return (response['list'] as List)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
