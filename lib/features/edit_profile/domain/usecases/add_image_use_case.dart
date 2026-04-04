import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repos/edit_profile_repo.dart';

class AddImageUseCase implements UseCase<Failure, void, String> {
  final EditProfileRepo _repo;

  AddImageUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repo.addImage(params);
  }
}
