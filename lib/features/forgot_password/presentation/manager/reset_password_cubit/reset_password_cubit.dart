import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:marketi/features/forgot_password/domain/usecases/reset_password_use_case.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_form_data.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase) : super(const ResetPasswordInitial());

  final ResetPasswordFormData formData = ResetPasswordFormData();

  Future<void> resetPassword() async {
    emit(const ResetPasswordLoading());
    final params = ResetPasswordParams(
      email: formData.email,
      password: formData.password,
      confirmPassword: formData.confirmPassword,
    );
    final result = await _resetPasswordUseCase(params);
    result.fold(
      (failure) =>
          emit(ResetPasswordFailure(failure.serverErrorMessage ?? failure.errMsg)),
      (_) => emit(const ResetPasswordSuccess()),
    );
  }
}
