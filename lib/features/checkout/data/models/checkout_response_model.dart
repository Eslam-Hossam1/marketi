import '../../domain/entities/checkout_entity.dart';

class CheckoutResponseModel extends CheckoutEntity {
  const CheckoutResponseModel({
    required super.clientSecret,
    required super.orderId,
    required super.subtotal,
    required super.shipping,
    required super.tax,
    required super.total,
    required super.currency,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckoutResponseModel(
      clientSecret: json['client_secret'] as String,
      orderId: json['order_id'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      shipping: (json['shipping'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_secret': clientSecret,
      'order_id': orderId,
      'subtotal': subtotal,
      'shipping': shipping,
      'tax': tax,
      'total': total,
      'currency': currency,
    };
  }
}
