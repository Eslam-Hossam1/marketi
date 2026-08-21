import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:nextcart/features/forgot_password/domain/params/send_code_params.dart';

abstract class ForgotPasswordRepo {
  Future<Either<ApiFailure, void>> sendCode(SendCodeParams params);
  Future<Either<ApiFailure, void>> resetPassword(ResetPasswordParams params);
}
