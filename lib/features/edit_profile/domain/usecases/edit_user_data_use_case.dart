import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../params/edit_user_data_params.dart';
import '../repos/edit_profile_repo.dart';

class EditUserDataUseCase implements UseCase<Failure, void, EditUserDataParams> {
  final EditProfileRepo _repo;

  EditUserDataUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(EditUserDataParams params) {
    return _repo.editUserData(params);
  }
}

