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
  const BrandsLoaded();
}

class BrandsError extends BrandsState {
  final String message;

  const BrandsError(this.message);
}
