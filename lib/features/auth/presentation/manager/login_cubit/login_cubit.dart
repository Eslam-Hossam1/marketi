import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/domain/params/login_params.dart';
import 'package:marketi/features/auth/domain/usecases/login_use_case.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_form_data.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginInitial());

  final LoginFormData formData = LoginFormData();

  Future<void> login() async {
    emit(const LoginLoading());
    final params = LoginParams(
      email: formData.email,
      password: formData.password,
    );
    final result = await _loginUseCase(params);
    result.fold(
      (failure) =>
          emit(LoginFailure(failure.serverErrorMessage ?? failure.errMsg)),
      (_) => emit(const LoginSuccess()),
    );
  }
}
