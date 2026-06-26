import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_auth_failure.dart';
import 'package:nextcart/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:nextcart/features/auth/data/models/login_request_model.dart';
import 'package:nextcart/features/auth/data/models/sign_up_request_model.dart';
import 'package:nextcart/features/auth/domain/entities/auth_entity.dart';
import 'package:nextcart/features/auth/domain/params/login_params.dart';
import 'package:nextcart/features/auth/domain/params/sign_up_params.dart';
import 'package:nextcart/features/auth/domain/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, AuthEntity>> login(LoginParams params) async {
    try {
      final requestModel = LoginRequestModel.fromParams(params);
      final response = await _remoteDataSource.login(requestModel);
      final token = response.session?.accessToken ?? '';
      return Right(AuthEntity(token: token));
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(
        SupabaseAuthFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, AuthEntity>> signUp(SignUpParams params) async {
    try {
      final requestModel = SignUpRequestModel.fromParams(params);
      final response = await _remoteDataSource.signUp(requestModel);
      final token = response.session?.accessToken ?? '';
      return Right(AuthEntity(token: token));
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(
        SupabaseAuthFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
