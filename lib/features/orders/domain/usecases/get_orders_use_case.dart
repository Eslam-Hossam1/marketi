import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../entities/order_entity.dart';
import '../repos/orders_repo.dart';

class GetOrdersUseCase implements NoParamUseCase<ApiFailure, List<OrderEntity>> {
  final OrdersRepo _ordersRepo;

  GetOrdersUseCase(this._ordersRepo);

  @override
  Future<Either<ApiFailure, List<OrderEntity>>> call() {
    return _ordersRepo.getOrders();
  }
}
