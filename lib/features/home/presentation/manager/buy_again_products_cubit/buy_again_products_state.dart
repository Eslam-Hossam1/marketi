abstract class BuyAgainProductsState {
  const BuyAgainProductsState();
}

class BuyAgainProductsInitial extends BuyAgainProductsState {
  const BuyAgainProductsInitial();
}

class BuyAgainProductsLoading extends BuyAgainProductsState {
  const BuyAgainProductsLoading();
}

class BuyAgainProductsLoaded extends BuyAgainProductsState {
  const BuyAgainProductsLoaded();
}

class BuyAgainProductsError extends BuyAgainProductsState {
  final String message;

  const BuyAgainProductsError(this.message);
}
