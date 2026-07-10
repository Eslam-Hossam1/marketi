import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import 'package:nextcart/features/auth/domain/repos/auth_repo.dart';

class LogoutUseCase implements NoParamUseCase<ApiFailure, void> {
  final AuthRepo _authRepo;

  LogoutUseCase(this._authRepo);

  @override
  Future<Either<ApiFailure, void>> call() async {
    return await _authRepo.logout();
  }
}
