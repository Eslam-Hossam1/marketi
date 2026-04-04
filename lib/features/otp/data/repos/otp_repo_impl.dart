import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api_failure.dart';
import '../../../../core/errors/dio_api_failure.dart';
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
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          DioApiFailure.fromDioException(e),
        );
      }
      return Left(
        DioApiFailure.unknownException(
          unKnownExceptionMsg: e.toString(),
        ),
      );
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
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          DioApiFailure.fromDioException(e),
        );
      }
      return Left(
        DioApiFailure.unknownException(
          unKnownExceptionMsg: e.toString(),
        ),
      );
    }
  }
}
