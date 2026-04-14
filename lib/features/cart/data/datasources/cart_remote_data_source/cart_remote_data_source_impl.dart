import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/features/cart/data/models/cart_response_model.dart';
import 'cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CartRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<CartResponseModel> getCart() async {
    final response = await _apiConsumer.get(EndPoints.getCart);
    return CartResponseModel.fromJson(response);
  }

  @override
  Future<void> addToCart(String productId) async {
    await _apiConsumer.post(
      EndPoints.addCart,
      data: {'productId': productId},
    );
  }

  @override
  Future<void> removeFromCart(String productId) async {
    await _apiConsumer.delete(
      EndPoints.deleteCart,
      data: {'productId': productId},
    );
  }
}
