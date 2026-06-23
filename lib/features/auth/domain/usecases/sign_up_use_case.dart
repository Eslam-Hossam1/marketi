import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/usecases/use_case.dart';
import 'package:nexcart/features/auth/domain/entities/auth_entity.dart';
import 'package:nexcart/features/auth/domain/params/sign_up_params.dart';
import 'package:nexcart/features/auth/domain/repos/auth_repo.dart';

class SignUpUseCase extends UseCase<ApiFailure, AuthEntity, SignUpParams> {
  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  @override
  Future<Either<ApiFailure, AuthEntity>> call(SignUpParams params) {
    return _repo.signUp(params);
  }
}
