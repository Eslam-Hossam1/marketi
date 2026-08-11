import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../entities/order_details_entity.dart';
import '../repos/orders_repo.dart';

class GetOrderDetailsUseCase implements UseCase<ApiFailure, OrderDetailsEntity, String> {
  final OrdersRepo _ordersRepo;

  GetOrderDetailsUseCase(this._ordersRepo);

  @override
  Future<Either<ApiFailure, OrderDetailsEntity>> call(String orderId) {
    return _ordersRepo.getOrderDetails(orderId);
  }
}
