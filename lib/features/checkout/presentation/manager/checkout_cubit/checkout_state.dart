import 'package:equatable/equatable.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

// Step 1: Fetching cart totals + creating payment intent
class CheckoutFetchingIntent extends CheckoutState {}

// Step 1 failed (e.g. empty cart, network error)
class CheckoutFetchIntentFailure extends CheckoutState {
  final String message;

  const CheckoutFetchIntentFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Step 1 succeeded — summary shown on screen. Response is on CheckoutCubit.checkoutResponse
class CheckoutReady extends CheckoutState {}

// Step 2: Stripe sheet is open (presenting)
class CheckoutPaymentSheetLoading extends CheckoutState {}

// Step 2: Stripe sheet done, waiting for Realtime to confirm 'paid'
class CheckoutProcessing extends CheckoutState {
  final String orderId;

  const CheckoutProcessing(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

// Realtime confirmed 'paid' before timeout. Response is on CheckoutCubit.checkoutResponse
class CheckoutSuccess extends CheckoutState {}

// Timeout fired before Realtime confirmed
class CheckoutProcessingDelay extends CheckoutState {}

// Webhook reported the PaymentIntent was cancelled by Stripe
class CheckoutCancelled extends CheckoutState {}

// Stripe returned failure (card declined, etc.) — user can retry
class CheckoutPaymentFailure extends CheckoutState {
  final String message;

  const CheckoutPaymentFailure(this.message);

  @override
  List<Object?> get props => [message];
}
