import 'package:nextcart/features/banners/data/models/banner_model.dart';

abstract class BannersRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}
