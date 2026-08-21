import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_status.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.userId,
    required super.status,
    required super.subtotalAmount,
    required super.shippingAmount,
    required super.taxAmount,
    required super.totalAmount,
    required super.currency,
    super.stripePaymentIntentId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'],
      status: OrderStatus.fromString(json['status']),
      subtotalAmount: (json['subtotal_amount'] as num).toDouble(),
      shippingAmount: (json['shipping_amount'] as num).toDouble(),
      taxAmount: (json['tax_amount'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      currency: json['currency'],
      stripePaymentIntentId: json['stripe_payment_intent_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'status': status.value,
      'subtotal_amount': subtotalAmount,
      'shipping_amount': shippingAmount,
      'tax_amount': taxAmount,
      'total_amount': totalAmount,
      'currency': currency,
      'stripe_payment_intent_id': stripePaymentIntentId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
