import 'package:marketi/core/entities/product_entity.dart';

class OrderEntity {
  final String id;
  final List<ProductEntity> products;
  final double totalPrice;
  final DateTime orderDate;
  final String status;

  const OrderEntity({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.orderDate,
    this.status = 'Completed',
  });
}
