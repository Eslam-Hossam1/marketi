import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_auth_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import '../datasources/favorites_remote_data_source/favorites_remote_data_source.dart';
import '../../domain/entities/favorites_entity.dart';
import '../../domain/params/favorite_product_params.dart';
import '../../domain/repos/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteDataSource _remoteDataSource;

  FavoritesRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, FavoritesEntity>> getFavorites() async {
    try {
      final result = await _remoteDataSource.getFavorites();
      return Right(result);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(
          unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, void>> addToFavorites(
      FavoriteProductParams params) async {

    try {
      await _remoteDataSource.addToFavorites(params.productId);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(
          unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, void>> removeFromFavorites(
      FavoriteProductParams params) async {
    try {
      await _remoteDataSource.removeFromFavorites(params.productId);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(
          unKnownExceptionMsg: e.toString()));
    }
  }
}
