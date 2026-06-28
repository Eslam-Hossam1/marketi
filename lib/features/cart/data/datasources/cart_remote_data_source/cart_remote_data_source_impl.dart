import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/cart/data/models/cart_response_model.dart';
import 'package:nextcart/core/models/product_model.dart';
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
        .select('*, products(*, categories(*), brands(*))')
        .eq('user_id', user.id);

    final List<ProductModel> products = (response as List).map((e) {
      return ProductModel.fromJson(e['products'] as Map<String, dynamic>);
    }).toList();

    return CartResponseModel(
      products: products,
      total: products.length,
      skip: 0,
      limit: products.length,
    );
  }

  @override
  Future<void> addToCart(String productId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    await _supabaseClient.from('cart').insert({
      'user_id': user.id,
      'product_id': productId,
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
}
