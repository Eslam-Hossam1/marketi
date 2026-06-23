import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import '../entities/order_entity.dart';
import '../params/add_order_params.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, void>> addOrder(AddOrderParams params);
}
