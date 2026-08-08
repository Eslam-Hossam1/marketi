import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/cart/data/models/cart_response_model.dart';
import 'cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final SupabaseClient _supabaseClient;

  CartRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<CartResponseModel> getCart() async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final response = await _supabaseClient
        .from('cart')
        .select('quantity, products(*, categories(*), brands(*))')
        .eq('user_id', user.id);

    return CartResponseModel.fromSupabase(response as List<dynamic>);
  }

  @override
  Future<void> addToCart(String productId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient.from('cart').insert({
      'user_id': user.id,
      'product_id': productId,
      'quantity': 1,
    });
  }

  @override
  Future<void> removeFromCart(String productId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient
        .from('cart')
        .delete()
        .eq('user_id', user.id)
        .eq('product_id', productId);
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient
        .from('cart')
        .update({'quantity': quantity})
        .eq('user_id', user.id)
        .eq('product_id', productId);
  }

  @override
  Future<void> clearCart() async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient
        .from('cart')
        .delete()
        .eq('user_id', user.id);
  }
}
