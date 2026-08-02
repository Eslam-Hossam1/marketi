import 'package:nextcart/features/orders/data/models/order_model.dart';

import '../../../domain/params/checkout_params.dart';

abstract class OrdersRemoteDataSource {
  Future<Map<String, dynamic>> createCheckout(CheckoutParams params);
  Future<List<OrderModel>> getOrders();
  Future<Map<String, dynamic>> getOrderDetails(String orderId);
}
