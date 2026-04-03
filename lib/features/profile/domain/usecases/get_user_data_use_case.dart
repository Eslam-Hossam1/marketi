import 'package:dartz/dartz.dart';

import '../../../../core/errors/api_failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/user_profile_entity.dart';
import '../repos/profile_repo.dart';

class GetUserDataUseCase
    implements NoParamUseCase<ApiFailure, UserProfileEntity> {
  final ProfileRepo _profileRepo;

  GetUserDataUseCase(this._profileRepo);

  @override
  Future<Either<ApiFailure, UserProfileEntity>> call() {
    return _profileRepo.getUserData();
  }
}
