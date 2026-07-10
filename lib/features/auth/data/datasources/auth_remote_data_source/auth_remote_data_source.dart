import 'package:nextcart/features/auth/data/models/login_request_model.dart';
import 'package:nextcart/features/auth/data/models/sign_up_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequestModel requestModel);
  Future<AuthResponse> signUp(SignUpRequestModel requestModel);
  Future<void> logout();
}
