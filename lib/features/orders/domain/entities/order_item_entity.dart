import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final String id;
  final String orderId;
  final String? productId;
  final String productName;
  final String productImage;
  final double unitPrice;
  final int quantity;
  final double subtotal;
  final DateTime createdAt;

  const OrderItemEntity({
    required this.id,
    required this.orderId,
    this.productId,
    required this.productName,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    required this.subtotal,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        productId,
        productName,
        productImage,
        unitPrice,
        quantity,
        subtotal,
        createdAt,
      ];
}
