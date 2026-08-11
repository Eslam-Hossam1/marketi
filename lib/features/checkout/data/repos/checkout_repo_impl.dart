import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_edge_function_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/checkout_entity.dart';
import '../../domain/params/checkout_params.dart';
import '../../domain/repos/checkout_repo.dart';
import '../datasources/checkout_remote_data_source/checkout_remote_data_source.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, CheckoutEntity>> createCheckout(CheckoutParams params) async {
    try {
      final model = await _remoteDataSource.createCheckout(params);
      
      return Right(model);
    } on SupabaseEdgeFunctionFailure catch (e) {
      return Left(e);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}

