import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:marketi/features/forgot_password/domain/repos/forgot_password_repo.dart';

class ResetPasswordUseCase extends UseCase<ApiFailure, void, ResetPasswordParams> {
  final ForgotPasswordRepo _repo;

  ResetPasswordUseCase(this._repo);

  @override
  Future<Either<ApiFailure, void>> call(ResetPasswordParams params) {
    return _repo.resetPassword(params);
  }
}
