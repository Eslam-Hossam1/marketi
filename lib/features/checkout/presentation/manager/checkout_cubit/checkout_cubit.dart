import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/services/stripe_service/stripe_service.dart';
import 'package:nextcart/features/cart/domain/usecases/clear_cart_use_case.dart';
import '../../../domain/entities/checkout_response_entity.dart';
import '../../../domain/params/checkout_params.dart';
import '../../../domain/usecases/create_checkout_use_case.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CreateCheckoutUseCase _createCheckoutUseCase;
  final StripeService _stripeService;
  final SupabaseClient _supabaseClient;
  final ClearCartUseCase _clearCartUseCase;

  CheckoutCubit({
    required CreateCheckoutUseCase createCheckoutUseCase,
    required StripeService stripeService,
    required SupabaseClient supabaseClient,
    required ClearCartUseCase clearCartUseCase,
  })  : _createCheckoutUseCase = createCheckoutUseCase,
        _stripeService = stripeService,
        _supabaseClient = supabaseClient,
        _clearCartUseCase = clearCartUseCase,
        super(CheckoutInitial());

  CheckoutResponseEntity? checkoutResponse;
  StreamSubscription<List<Map<String, dynamic>>>? _streamSubscription;
  Timer? _timeoutTimer;

  // ── 1. Fetch Intent ──────────────────────────────────────────────────────────

  Future<void> fetchIntent({String currency = 'usd'}) async {
    emit(CheckoutFetchingIntent());

    final result = await _createCheckoutUseCase(CheckoutParams(currency: currency));

    result.fold(
      (failure) => emit(CheckoutFetchIntentFailure(failure.errMsg)),
      (response) {
        checkoutResponse = response;
        emit(CheckoutReady());
      },
    );
  }

  // ── 2. Pay ───────────────────────────────────────────────────────────────────

  Future<void> pay() async {
    if (checkoutResponse == null) return;

    emit(CheckoutPaymentSheetLoading());

    final paymentResult = await _stripeService.presentPaymentSheet(
      clientSecret: checkoutResponse!.clientSecret,
    );

    paymentResult.fold(
      (failure) {
        if (failure.errMsg == 'Payment cancelled by user') {
          // Silent revert to ready state if user cancels
          emit(CheckoutReady());
        } else {
          emit(CheckoutPaymentFailure(failure.errMsg));
          // Re-emit Ready state so the user can click Pay again after dialog dismisses
          emit(CheckoutReady());
        }
      },
      (_) {
        // Stripe sheet succeeded!
        // Wait for Realtime confirmation from the webhook
        _waitForRealtimeConfirmation(checkoutResponse!.orderId);
      },
    );
  }

  // ── 3. Realtime Webhook Polling ──────────────────────────────────────────────

  void _waitForRealtimeConfirmation(String orderId) {
    emit(CheckoutProcessing(orderId));

    // Stream the specific order row — fires on every update
    _streamSubscription = _supabaseClient
        .from('orders')
        .stream(primaryKey: ['id'])
        .eq('id', orderId)
        .listen((rows) {
          if (rows.isEmpty) return;
          final status = rows.first['status'] as String?;
          switch (status) {
            case 'paid':
              _cleanupRealtime();
              _clearCartUseCase();
              emit(CheckoutSuccess());
            case 'cancelled':
              _cleanupRealtime();
              emit(CheckoutCancelled());
            case 'pending_payment':
              // Webhook reported failure — Stripe already showed an error,
              // so just revert to Ready so the user can retry.
              _cleanupRealtime();
              emit(CheckoutPaymentFailure('Your payment failed. Please try again.'));
              emit(CheckoutReady());
            default:
              // Still pending — keep waiting
              break;
          }
        });

    // Start 10-second timeout fallback
    _timeoutTimer = Timer(const Duration(seconds: 10), _onTimeoutFired);
  }

  Future<void> _onTimeoutFired() async {
    _cleanupRealtime();
    await _clearCartUseCase();
    emit(CheckoutProcessingDelay());
  }

  void _cleanupRealtime() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }

  @override
  Future<void> close() {
    _cleanupRealtime();
    return super.close();
  }
}
