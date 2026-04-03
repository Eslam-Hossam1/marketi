import 'package:marketi/features/forgot_password/data/models/reset_password_request_model.dart';
import 'package:marketi/features/forgot_password/data/models/send_code_request_model.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<void> sendCode(SendCodeRequestModel requestModel);
  Future<void> resetPassword(ResetPasswordRequestModel requestModel);
}
