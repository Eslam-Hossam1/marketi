import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/domain/params/sign_up_params.dart';
import 'package:marketi/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_form_data.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(const SignUpInitial());

  final SignUpFormData formData = SignUpFormData();

  Future<void> signUp() async {
    emit(const SignUpLoading());
    final params = SignUpParams(
      name: formData.name,
      phone: formData.phone,
      email: formData.email,
      password: formData.password,
      confirmPassword: formData.confirmPassword,
    );
    final result = await _signUpUseCase(params);
    result.fold(
      (failure) =>
          emit(SignUpFailure(failure.serverErrorMessage ?? failure.errMsg)),
      (_) => emit(const SignUpSuccess()),
    );
  }
}
