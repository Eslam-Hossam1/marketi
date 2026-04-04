import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/services/auth_credentials_manager/auth_credentials_manager.dart';
import 'package:marketi/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:marketi/features/auth/data/models/login_request_model.dart';
import 'package:marketi/features/auth/data/models/sign_up_request_model.dart';
import 'package:marketi/features/auth/domain/entities/auth_entity.dart';
import 'package:marketi/features/auth/domain/params/login_params.dart';
import 'package:marketi/features/auth/domain/params/sign_up_params.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthCredentialsManager _authCredentialsManager;

  AuthRepoImpl(this._remoteDataSource, this._authCredentialsManager);

  @override
  Future<Either<ApiFailure, AuthEntity>> login(LoginParams params) async {
    try {
      final requestModel = LoginRequestModel.fromParams(params);
      final loginModel = await _remoteDataSource.login(requestModel);
      await _authCredentialsManager.storeAccessToken(loginModel.token);
      return Right(loginModel.toEntity());
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, AuthEntity>> signUp(SignUpParams params) async {
    try {
      final requestModel = SignUpRequestModel.fromParams(params);
      final signUpModel = await _remoteDataSource.signUp(requestModel);
      await _authCredentialsManager.storeAccessToken(signUpModel.token);
      return Right(signUpModel.toEntity());
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
