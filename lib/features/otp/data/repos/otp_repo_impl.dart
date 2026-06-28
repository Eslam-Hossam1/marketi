import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/errors/api_failure.dart';

import '../../domain/entities/otp_reason.dart';
import '../../domain/entities/otp_result.dart';
import '../../domain/repos/otp_repo.dart';
import '../data_sources/otp_remote_data_source.dart';

class OtpRepoImpl implements OtpRepo {
  final OtpRemoteDataSource _otpRemoteDataSource;

  OtpRepoImpl({required OtpRemoteDataSource otpRemoteDataSource})
      : _otpRemoteDataSource = otpRemoteDataSource;
  @override
  Future<Either<ApiFailure, void>> sendOtp({
    required OtpReason<OtpResult> otpReason,
  }) async {
    try {
      await _otpRemoteDataSource.sendOtp(
        otpReason: otpReason,
      );
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, OtpResult>> verifyOtp(
      {required OtpReason<OtpResult> otpReason,
      required String pinCode}) async {
    try {
      final OtpResult otpResult = await _otpRemoteDataSource.verifyOtp(
        otpReason: otpReason,
        pinCode: pinCode,
      );
      return Right(otpResult);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
