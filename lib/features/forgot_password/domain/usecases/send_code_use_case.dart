import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import 'package:nextcart/features/forgot_password/domain/params/send_code_params.dart';
import 'package:nextcart/features/forgot_password/domain/repos/forgot_password_repo.dart';

class SendCodeUseCase extends UseCase<ApiFailure, void, SendCodeParams> {
  final ForgotPasswordRepo _repo;

  SendCodeUseCase(this._repo);

  @override
  Future<Either<ApiFailure, void>> call(SendCodeParams params) {
    return _repo.sendCode(params);
  }
}
