import 'package:equatable/equatable.dart';

class CheckoutResponseEntity extends Equatable {
  final String clientSecret;
  final String orderId;
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;
  final String currency;

  const CheckoutResponseEntity({
    required this.clientSecret,
    required this.orderId,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
    required this.currency,
  });

  @override
  List<Object?> get props => [
        clientSecret,
        orderId,
        subtotal,
        shipping,
        tax,
        total,
        currency,
      ];
}
