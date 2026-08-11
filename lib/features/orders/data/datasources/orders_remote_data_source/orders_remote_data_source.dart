import 'package:nextcart/features/orders/data/models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<Map<String, dynamic>> getOrderDetails(String orderId);
}
