class OrderDetailsParams {
  final String orderId;
  final bool fromCheckout;

  const OrderDetailsParams({
    required this.orderId,
    this.fromCheckout = false,
  });
}
