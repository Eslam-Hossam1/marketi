import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/features/auth/domain/entities/auth_entity.dart';
import 'package:nextcart/features/auth/domain/params/login_params.dart';
import 'package:nextcart/features/auth/domain/params/sign_up_params.dart';

abstract class AuthRepo {
  Future<Either<ApiFailure, AuthEntity>> login(LoginParams params);
  Future<Either<ApiFailure, AuthEntity>> signUp(SignUpParams params);
}
