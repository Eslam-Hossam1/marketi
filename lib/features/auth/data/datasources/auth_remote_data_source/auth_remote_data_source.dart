import 'package:marketi/features/auth/data/models/login_model.dart';
import 'package:marketi/features/auth/data/models/login_request_model.dart';
import 'package:marketi/features/auth/data/models/sign_up_model.dart';
import 'package:marketi/features/auth/data/models/sign_up_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginRequestModel requestModel);
  Future<SignUpModel> signUp(SignUpRequestModel requestModel);
}
