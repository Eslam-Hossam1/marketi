enum OrderStatus {
  pendingPayment('pending_payment'),
  paid('paid'),
  processing('processing'),
  shipped('shipped'),
  delivered('delivered'),
  cancelled('cancelled'),
  refunded('refunded');

  final String value;
  const OrderStatus(this.value);

  factory OrderStatus.fromString(String status) {
    return OrderStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => OrderStatus.pendingPayment,
    );
  }
}
