import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/features/forgot_password/data/datasources/forgot_password_remote_data_source/forgot_password_remote_data_source.dart';
import 'package:marketi/features/forgot_password/data/models/reset_password_request_model.dart';
import 'package:marketi/features/forgot_password/data/models/send_code_request_model.dart';
import 'package:marketi/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:marketi/features/forgot_password/domain/params/send_code_params.dart';
import 'package:marketi/features/forgot_password/domain/repos/forgot_password_repo.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, void>> sendCode(SendCodeParams params) async {
    try {
      final requestModel = SendCodeRequestModel(email: params.email);
       await _remoteDataSource.sendCode(requestModel);
       return const Right(null);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }

  @override
  Future<Either<ApiFailure, void>> resetPassword(ResetPasswordParams params) async {
    try {
      final requestModel = ResetPasswordRequestModel(
        email: params.email,
        password: params.password,
        confirmPassword: params.confirmPassword,
      );
      await _remoteDataSource.resetPassword(requestModel);
      return const Right(null);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
