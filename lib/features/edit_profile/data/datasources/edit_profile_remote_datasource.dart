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
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', name: 'deleteImage');
    log('🗑️  deleteImage called', name: 'deleteImage');
    log('📎 imageUrl: $imageUrl', name: 'deleteImage');
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user == null) {
        log('❌ No authenticated user found — aborting', name: 'deleteImage');
        return;
      }
      log('👤 Current user ID: ${user.id}', name: 'deleteImage');

      // List all files in the bucket
      log('📂 Listing all files in avatars bucket...', name: 'deleteImage');
      final files = await _supabaseClient.storage.from('avatars').list();
      log('📋 Total files in bucket: ${files.length}', name: 'deleteImage');
      for (final f in files) {
        log('   • ${f.name}', name: 'deleteImage');
      }

      final allFiles = files.map((f) => f.name).toList();

      if (allFiles.isEmpty) {
        log('✅ Nothing to delete', name: 'deleteImage');
        log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', name: 'deleteImage');
        return;
      }

      // Delete each file one by one
      for (final fileName in allFiles) {
        log('🗑️  Deleting: $fileName', name: 'deleteImage');
        final response = await _supabaseClient.storage.from('avatars').remove([fileName]);
        if (response.isEmpty) {
          log('⚠️  Delete returned empty — policy may be blocking: $fileName', name: 'deleteImage');
        } else {
          log('✅ Deleted successfully: $fileName', name: 'deleteImage');
        }
      }
      log('🏁 deleteImage complete', name: 'deleteImage');
    } catch (e, st) {
      log('❌ Exception during deleteImage: $e', name: 'deleteImage', error: e, stackTrace: st);
    }
    log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', name: 'deleteImage');
  }
}
