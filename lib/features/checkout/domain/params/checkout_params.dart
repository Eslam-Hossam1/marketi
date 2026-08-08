import 'package:equatable/equatable.dart';

class CheckoutParams extends Equatable {
  final String currency;

  const CheckoutParams({
    this.currency = 'usd',
  });

  Map<String, dynamic> toJson() => {
        'currency': currency,
      };

  @override
  List<Object?> get props => [currency];
}
