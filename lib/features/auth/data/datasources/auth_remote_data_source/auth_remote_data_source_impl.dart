import 'package:nextcart/core/services/supabase_service/supabase_service.dart';
import 'package:nextcart/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:nextcart/features/auth/data/models/login_request_model.dart';
import 'package:nextcart/features/auth/data/models/sign_up_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<AuthResponse> login(LoginRequestModel requestModel) async {
    try {
      final response = await SupabaseService.client.auth.signInWithPassword(
        email: requestModel.email,
        password: requestModel.password,
      );
      return response;
    } on AuthException catch (e) {
      if (e.message.toLowerCase().contains('email not confirmed')) {
        try {
          await SupabaseService.client.auth.resend(
            type: OtpType.signup,
            email: requestModel.email,
            emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
          );
        } catch (_) {
          // Ignore resend errors, continue to throw original exception
        }
      }
      rethrow;
    }
  }

  @override
  Future<AuthResponse> signUp(SignUpRequestModel requestModel) async {
    final response = await SupabaseService.client.auth.signUp(
      email: requestModel.email,
      password: requestModel.password,
      data: {'name': requestModel.name, 'phone': requestModel.phone},
      emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
    );
    
    if (response.user != null && (response.user!.identities?.isEmpty ?? false)) {
      throw const AuthException(
        'User already registered',
        statusCode: '400',
      );
    }
    
    return response;
  }
}
