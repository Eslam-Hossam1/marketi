import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/features/forgot_password/data/datasources/forgot_password_remote_data_source/forgot_password_remote_data_source.dart';
import 'package:nextcart/features/forgot_password/data/models/reset_password_request_model.dart';
import 'package:nextcart/features/forgot_password/data/models/send_code_request_model.dart';
import 'package:nextcart/features/forgot_password/domain/params/reset_password_params.dart';
import 'package:nextcart/features/forgot_password/domain/params/send_code_params.dart';
import 'package:nextcart/features/forgot_password/domain/repos/forgot_password_repo.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, void>> sendCode(SendCodeParams params) async {
    try {
      final requestModel = SendCodeRequestModel(email: params.email);
       await _remoteDataSource.sendCode(requestModel);
       return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
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
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
