import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/features/auth/domain/entities/auth_entity.dart';
import 'package:nexcart/features/auth/domain/params/login_params.dart';
import 'package:nexcart/features/auth/domain/params/sign_up_params.dart';

abstract class AuthRepo {
  Future<Either<ApiFailure, AuthEntity>> login(LoginParams params);
  Future<Either<ApiFailure, AuthEntity>> signUp(SignUpParams params);
}
