import 'dart:io';
import 'package:flutter/foundation.dart';
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
    
    await _supabaseClient.storage
        .from('avatars')
        .upload(fileName, file);
        
    final imageUrl = _supabaseClient.storage.from('avatars').getPublicUrl(fileName);
    return imageUrl;
  }

  @override
  Future<void> deleteImage(String imageUrl) async {
    try {
      // Extract the file path from the public URL
      // URL format: .../storage/v1/object/public/avatars/filename.ext
      final uri = Uri.parse(imageUrl);
      final segments = uri.pathSegments;
      final avatarsIndex = segments.indexOf('avatars');
      if (avatarsIndex == -1 || avatarsIndex + 1 >= segments.length) return;
      final filePath = segments.sublist(avatarsIndex + 1).join('/');
      await _supabaseClient.storage.from('avatars').remove([filePath]);
    } catch (e) {
      debugPrint('[AppAvatar] Failed to delete old avatar: $e');
    }
  }
}
