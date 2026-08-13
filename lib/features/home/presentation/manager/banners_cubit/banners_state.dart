import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';

abstract class BannersState {
  const BannersState();
}

class BannersInitial extends BannersState {
  const BannersInitial();
}

class BannersLoading extends BannersState {
  const BannersLoading();
}

class BannersLoaded extends BannersState {
  final List<BannerEntity> banners;
  const BannersLoaded(this.banners);
}

class BannersError extends BannersState {
  final String message;
  const BannersError(this.message);
}
