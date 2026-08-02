import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/params/checkout_params.dart';
import '../../../domain/usecases/create_checkout_use_case.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CreateCheckoutUseCase _createCheckoutUseCase;

  CheckoutCubit(this._createCheckoutUseCase) : super(CheckoutInitial());

  Future<void> checkout({String currency = 'usd'}) async {
    emit(CheckoutLoading());
    
    final result = await _createCheckoutUseCase(CheckoutParams(currency: currency));
    
    result.fold(
      (failure) => emit(CheckoutFailure(failure.errMsg)),
      (_) => emit(CheckoutSuccess()),
    );
  }
}
