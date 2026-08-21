import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_order_details_use_case.dart';
import '../../../domain/usecases/get_orders_use_case.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;

  OrdersCubit(
    this._getOrdersUseCase,
    this._getOrderDetailsUseCase,
  ) : super(OrdersInitial());

  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    
    final result = await _getOrdersUseCase();
    
    result.fold(
      (failure) => emit(OrdersFailure(failure.errMsg)),
      (orders) => emit(OrdersSuccess(orders)),
    );
  }

  Future<void> fetchOrderDetails(String orderId) async {
    emit(OrderDetailsLoading());
    
    final result = await _getOrderDetailsUseCase(orderId);
    
    result.fold(
      (failure) => emit(OrderDetailsFailure(failure.errMsg)),
      (orderDetails) => emit(OrderDetailsSuccess(orderDetails)),
    );
  }
}
