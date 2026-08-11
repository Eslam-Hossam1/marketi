import 'package:equatable/equatable.dart';
import 'order_entity.dart';
import 'order_item_entity.dart';

class OrderDetailsEntity extends Equatable {
  final OrderEntity order;
  final List<OrderItemEntity> items;

  const OrderDetailsEntity({
    required this.order,
    required this.items,
  });

  @override
  List<Object?> get props => [order, items];
}
