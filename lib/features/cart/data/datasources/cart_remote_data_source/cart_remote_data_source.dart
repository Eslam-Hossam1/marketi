import 'package:marketi/features/cart/data/models/cart_response_model.dart';

abstract class CartRemoteDataSource {
  Future<CartResponseModel> getCart();
  Future<void> addToCart(String productId);
  Future<void> removeFromCart(String productId);
}
