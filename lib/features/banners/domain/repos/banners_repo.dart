import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';

abstract class BannersRepo {
  Future<Either<ApiFailure, List<BannerEntity>>> getBanners();
}
