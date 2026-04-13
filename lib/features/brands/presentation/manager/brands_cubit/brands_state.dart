import 'package:marketi/core/entities/brand_entity.dart';

abstract class BrandsState {
  const BrandsState();
}

class BrandsInitial extends BrandsState {
  const BrandsInitial();
}

class BrandsLoading extends BrandsState {
  const BrandsLoading();
}

class BrandsLoaded extends BrandsState {
  final List<BrandEntity> brands;
  const BrandsLoaded(this.brands);
}

class BrandsError extends BrandsState {
  final String message;
  const BrandsError(this.message);
}
