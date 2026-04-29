import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentUrlSuccess extends PaymentState {
  final String paymentUrl;

  const PaymentUrlSuccess(this.paymentUrl);

  @override
  List<Object?> get props => [paymentUrl];
}

class PaymentFailure extends PaymentState {
  final String errMessage;

  const PaymentFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
