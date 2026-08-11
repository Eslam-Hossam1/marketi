import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import '../entities/order_details_entity.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<ApiFailure, List<OrderEntity>>> getOrders();
  Future<Either<ApiFailure, OrderDetailsEntity>> getOrderDetails(String orderId);
}

