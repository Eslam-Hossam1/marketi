import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../params/edit_user_data_params.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, void>> editUserData(EditUserDataParams params);
  Future<Either<Failure, void>> addImage(String filePath);
}

