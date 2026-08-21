import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/edit_profile/data/models/edit_user_data_request_model.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> editUserData(EditUserDataRequestModel requestModel);
  Future<String> addImage(String filePath);
  Future<void> deleteImage(String imageUrl);
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
  Future<String> addImage(String filePath) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final file = File(filePath);
    final fileExt = filePath.split('.').last;
    final fileName = '${user.id}_${DateTime.now().millisecondsSinceEpoch}.$fileExt';

    await _supabaseClient.storage.from('avatars').upload(fileName, file);

    final imageUrl = _supabaseClient.storage.from('avatars').getPublicUrl(fileName);
    return imageUrl;
  }

  @override
  Future<void> deleteImage(String imageUrl) async {
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user == null) return;

      final String fileName = imageUrl.split('/').last;

      if (fileName.isNotEmpty) {
        await _supabaseClient.storage.from('avatars').remove([fileName]);
      }
    } catch (e) {
      // Fire-and-forget, ignore errors during cleanup
    }
  }
}
