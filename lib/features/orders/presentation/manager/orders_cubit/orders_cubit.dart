import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/params/add_order_params.dart';
import '../../../domain/usecases/add_order_use_case.dart';
import '../../../domain/usecases/get_orders_use_case.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;
  final AddOrderUseCase _addOrderUseCase;

  OrdersCubit(this._getOrdersUseCase, this._addOrderUseCase) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await _getOrdersUseCase();
    result.fold(
      (failure) => emit(OrdersFailure(failure.errMsg)),
      (orders) => emit(OrdersSuccess(orders.reversed.toList())), // Show newest first
    );
  }

  Future<void> addOrder(AddOrderParams params) async {
    emit(AddOrderLoading());
    final result = await _addOrderUseCase(params);
    result.fold(
      (failure) => emit(OrdersFailure(failure.errMsg)),
      (_) => emit(AddOrderSuccess()),
    );
  }
}
