import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/edit_profile/data/models/edit_user_data_request_model.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> editUserData(EditUserDataRequestModel requestModel);
  Future<void> addImage(String filePath);
}

class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final SupabaseClient _supabaseClient;

  EditProfileRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<void> editUserData(EditUserDataRequestModel requestModel) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');
    
    await _supabaseClient.from('profiles').update(requestModel.toJson()).eq('id', user.id);
  }

  @override
  Future<void> addImage(String filePath) async {
    // Add logic to upload image to Supabase Storage if required
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');
  }
}
