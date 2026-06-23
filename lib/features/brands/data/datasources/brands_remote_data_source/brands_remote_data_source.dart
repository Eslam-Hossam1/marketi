import 'package:nexcart/core/models/brand_model.dart';

abstract class BrandsRemoteDataSource {
  Future<List<BrandModel>> getBrands();
}
