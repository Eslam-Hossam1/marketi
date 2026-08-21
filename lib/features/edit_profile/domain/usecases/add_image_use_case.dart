import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repos/edit_profile_repo.dart';

class AddImageUseCase implements UseCase<Failure, String, String> {
  final EditProfileRepo _repo;

  AddImageUseCase(this._repo);

  @override
  Future<Either<Failure, String>> call(String params) {
    return _repo.addImage(params);
  }
}
