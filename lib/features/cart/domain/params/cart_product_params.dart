class CartProductParams {
  final String productId;
  final int quantity;

  const CartProductParams({
    required this.productId,
    this.quantity = 1,
  });
}
