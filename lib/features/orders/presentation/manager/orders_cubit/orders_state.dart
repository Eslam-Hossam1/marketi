import 'package:equatable/equatable.dart';
import '../../../domain/entities/order_details_entity.dart';
import '../../../domain/entities/order_entity.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;

  const OrdersSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrdersFailure extends OrdersState {
  final String message;

  const OrdersFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderDetailsLoading extends OrdersState {}

class OrderDetailsSuccess extends OrdersState {
  final OrderDetailsEntity orderDetails;

  const OrderDetailsSuccess(this.orderDetails);

  @override
  List<Object?> get props => [orderDetails];
}

class OrderDetailsFailure extends OrdersState {
  final String message;

  const OrderDetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
