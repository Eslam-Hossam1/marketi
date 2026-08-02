import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_edge_function_failure.dart';
import 'package:nextcart/core/services/stripe_service/stripe_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/order_details_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/params/checkout_params.dart';
import '../../domain/repos/orders_repo.dart';
import '../datasources/orders_remote_data_source/orders_remote_data_source.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  final StripeService _stripeService;

  OrdersRepoImpl(this._remoteDataSource, this._stripeService);

  @override
  Future<Either<ApiFailure, void>> createCheckout(CheckoutParams params) async {
    try {
      // 1. Call Edge Function
      final responseData = await _remoteDataSource.createCheckout(params);
      
      final clientSecret = responseData['client_secret'] as String;
      
      // 2. Present Payment Sheet
      final paymentResult = await _stripeService.presentPaymentSheet(clientSecret: clientSecret);
      
      return paymentResult.fold(
        (failure) => Left(failure),
        (_) => const Right(null),
      );
    } on SupabaseEdgeFunctionFailure catch (e) {
      return Left(e);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }

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
