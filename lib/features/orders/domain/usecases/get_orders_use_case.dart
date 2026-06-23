import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../entities/order_entity.dart';
import '../repos/orders_repo.dart';

class GetOrdersUseCase extends NoParamUseCase<Failure, List<OrderEntity>> {
  final OrdersRepo _ordersRepo;

  GetOrdersUseCase(this._ordersRepo);

  @override
  Future<Either<Failure, List<OrderEntity>>> call() {
    return _ordersRepo.getOrders();
  }
}
