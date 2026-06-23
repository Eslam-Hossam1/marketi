import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/database_failure.dart';
import 'package:marketi/core/errors/failures.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/params/add_order_params.dart';
import '../../domain/repos/orders_repo.dart';
import '../datasources/orders_local_data_source.dart';
import '../models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersLocalDataSource _localDataSource;

  OrdersRepoImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> addOrder(AddOrderParams params) async {
    try {
      final model = OrderModel.fromEntity(params.order);
      await _localDataSource.addOrder(model);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await _localDataSource.getOrders();
      return Right(orders);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
