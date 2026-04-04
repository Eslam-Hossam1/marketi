abstract class PopularProductsState {
  const PopularProductsState();
}

class PopularProductsInitial extends PopularProductsState {
  const PopularProductsInitial();
}

class PopularProductsLoading extends PopularProductsState {
  const PopularProductsLoading();
}

class PopularProductsLoaded extends PopularProductsState {
  const PopularProductsLoaded();
}

class PopularProductsError extends PopularProductsState {
  final String message;

  const PopularProductsError(this.message);
}
