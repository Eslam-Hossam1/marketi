import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/features/payment/domain/usecases/request_payment_use_case.dart';
import 'package:marketi/features/payment/presentation/manager/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final RequestPaymentUseCase _requestPaymentUseCase;

  PaymentCubit(this._requestPaymentUseCase) : super(PaymentInitial());

  Future<void> getPaymentUrl(PaymentParams params) async {
    emit(PaymentLoading());

    final result = await _requestPaymentUseCase(params);

    result.fold(
      (failure) => emit(PaymentFailure(failure.errMsg)),
      (paymentUrl) => emit(PaymentUrlSuccess(paymentUrl)),
    );
  }
}
