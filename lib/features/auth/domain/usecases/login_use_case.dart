import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/core/usecases/use_case.dart';
import 'package:nexcart/features/auth/domain/entities/auth_entity.dart';
import 'package:nexcart/features/auth/domain/params/login_params.dart';
import 'package:nexcart/features/auth/domain/repos/auth_repo.dart';

class LoginUseCase extends UseCase<ApiFailure, AuthEntity, LoginParams> {
  final AuthRepo _repo;

  LoginUseCase(this._repo);

  @override
  Future<Either<ApiFailure, AuthEntity>> call(LoginParams params) {
    return _repo.login(params);
  }
}
