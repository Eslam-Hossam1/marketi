abstract class BestForYouProductsState {
  const BestForYouProductsState();
}

class BestForYouProductsInitial extends BestForYouProductsState {
  const BestForYouProductsInitial();
}

class BestForYouProductsLoading extends BestForYouProductsState {
  const BestForYouProductsLoading();
}

class BestForYouProductsLoaded extends BestForYouProductsState {
  const BestForYouProductsLoaded();
}

class BestForYouProductsError extends BestForYouProductsState {
  final String message;

  const BestForYouProductsError(this.message);
}
