import 'package:dartz/dartz.dart';

import '../../../../core/errors/api_failure.dart';
import '../entities/user_profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<ApiFailure, UserProfileEntity>> getUserData();
}
