import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import 'package:nextcart/features/auth/domain/params/sign_up_params.dart';
import 'package:nextcart/features/auth/domain/repos/auth_repo.dart';

class SignUpUseCase extends UseCase<ApiFailure, void, SignUpParams> {
  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  @override
  Future<Either<ApiFailure, void>> call(SignUpParams params) {
    return _repo.signUp(params);
  }
}
