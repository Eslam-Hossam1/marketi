import 'package:nextcart/features/cart/data/models/cart_response_model.dart';

abstract class CartRemoteDataSource {
  Future<CartResponseModel> getCart();
  Future<void> addToCart(String productId);
  Future<void> removeFromCart(String productId);
  Future<void> updateQuantity(String productId, int quantity);
}
