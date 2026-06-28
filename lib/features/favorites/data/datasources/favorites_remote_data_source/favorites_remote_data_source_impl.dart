import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/favorites/data/models/favorites_response_model.dart';
import 'favorites_remote_data_source.dart';

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final SupabaseClient _supabaseClient;

  FavoritesRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<FavoritesResponseModel> getFavorites() async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final response = await _supabaseClient
        .from('favorites')
        .select('*, products(*, categories(*), brands(*))')
        .eq('user_id', user.id);

    return FavoritesResponseModel.fromSupabaseResponse(response as List);
  }

  @override
  Future<void> addToFavorites(String productId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient.from('favorites').insert({
      'user_id': user.id,
      'product_id': productId,
    });
  }

  @override
  Future<void> removeFromFavorites(String productId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient
        .from('favorites')
        .delete()
        .eq('user_id', user.id)
        .eq('product_id', productId);
  }
}
