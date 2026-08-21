import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile_model.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ProfileRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<UserProfileModel> getUserData() async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final response = await _supabaseClient
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();
        
    return UserProfileModel.fromJson(response);
  }
}
