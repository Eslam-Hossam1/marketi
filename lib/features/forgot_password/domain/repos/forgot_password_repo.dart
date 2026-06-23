import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/api_failure.dart';
import 'package:nexcart/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:nexcart/features/forgot_password/domain/params/send_code_params.dart';

abstract class ForgotPasswordRepo {
  Future<Either<ApiFailure, void>> sendCode(SendCodeParams params);
  Future<Either<ApiFailure, void>> resetPassword(ResetPasswordParams params);
}
