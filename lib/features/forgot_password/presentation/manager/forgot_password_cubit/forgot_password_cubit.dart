import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/forgot_password/domain/params/send_code_params.dart';
import 'package:marketi/features/forgot_password/domain/usecases/send_code_use_case.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_form_data.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final SendCodeUseCase _sendCodeUseCase;

  ForgotPasswordCubit(this._sendCodeUseCase) : super(const ForgotPasswordInitial());

  final ForgotPasswordFormData formData = ForgotPasswordFormData();

  Future<void> sendCode() async {
    emit(const ForgotPasswordLoading());
    final params = SendCodeParams(
      email: formData.email,
    );
    final result = await _sendCodeUseCase(params);
    result.fold(
      (failure) =>
          emit(ForgotPasswordFailure(failure.serverErrorMessage ?? failure.errMsg)),
      (_) => emit(const ForgotPasswordSuccess()),
    );
  }
}
