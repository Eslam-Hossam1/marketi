import '../models/order_model.dart';

abstract class OrdersLocalDataSource {
  Future<List<OrderModel>> getOrders();
  Future<void> addOrder(OrderModel order);
}
