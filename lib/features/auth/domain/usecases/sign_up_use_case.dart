import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/auth/domain/entities/auth_entity.dart';
import 'package:marketi/features/auth/domain/params/sign_up_params.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

class SignUpUseCase extends UseCase<ApiFailure, AuthEntity, SignUpParams> {
  final AuthRepo _repo;

  SignUpUseCase(this._repo);

  @override
  Future<Either<ApiFailure, AuthEntity>> call(SignUpParams params) {
    return _repo.signUp(params);
  }
}
