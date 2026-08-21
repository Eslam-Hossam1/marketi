import 'package:equatable/equatable.dart';
import 'order_status.dart';

class OrderEntity extends Equatable {
  final String id;
  final String userId;
  final OrderStatus status;
  final double subtotalAmount;
  final double shippingAmount;
  final double taxAmount;
  final double totalAmount;
  final String currency;
  final String? stripePaymentIntentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.status,
    required this.subtotalAmount,
    required this.shippingAmount,
    required this.taxAmount,
    required this.totalAmount,
    required this.currency,
    this.stripePaymentIntentId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        status,
        subtotalAmount,
        shippingAmount,
        taxAmount,
        totalAmount,
        currency,
        stripePaymentIntentId,
        createdAt,
        updatedAt,
      ];
}
