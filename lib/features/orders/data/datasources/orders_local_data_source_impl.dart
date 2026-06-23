import 'package:hive_ce/hive.dart';
import '../models/order_model.dart';
import 'orders_local_data_source.dart';

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  static const String _boxName = 'orders_box';

  @override
  Future<List<OrderModel>> getOrders() async {
    final box = await Hive.openBox(_boxName);
    final List<dynamic> data = box.get('orders', defaultValue: []);
    return data.map((e) => OrderModel.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> addOrder(OrderModel order) async {
    final box = await Hive.openBox(_boxName);
    final List<dynamic> data = box.get('orders', defaultValue: []);
    final updatedData = List<dynamic>.from(data)..add(order.toJson());
    await box.put('orders', updatedData);
  }
}
