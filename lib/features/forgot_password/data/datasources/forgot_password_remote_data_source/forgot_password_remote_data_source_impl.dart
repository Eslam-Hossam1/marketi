import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/forgot_password/data/datasources/forgot_password_remote_data_source/forgot_password_remote_data_source.dart';
import 'package:nextcart/features/forgot_password/data/models/reset_password_request_model.dart';
import 'package:nextcart/features/forgot_password/data/models/send_code_request_model.dart';

class ForgotPasswordRemoteDataSourceImpl
    implements ForgotPasswordRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ForgotPasswordRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<void> sendCode(SendCodeRequestModel requestModel) async {
    await _supabaseClient.auth.resetPasswordForEmail(requestModel.email!);
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel requestModel) async {
    await _supabaseClient.auth.updateUser(UserAttributes(password: requestModel.password));
  }
}
