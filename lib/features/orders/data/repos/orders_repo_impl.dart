import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/order_details_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/orders_repo.dart';
import '../datasources/orders_remote_data_source/orders_remote_data_source.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepoImpl(this._remoteDataSource,);

  @override
  Future<Either<ApiFailure, List<OrderEntity>>> getOrders() async {
    try {
      final result = await _remoteDataSource.getOrders();
      return Right(result);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, OrderDetailsEntity>> getOrderDetails(String orderId) async {
    try {
      final result = await _remoteDataSource.getOrderDetails(orderId);
      
      return Right(OrderDetailsEntity(
        order: result['order'],
        items: result['items'],
      ));
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
