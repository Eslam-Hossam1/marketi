import 'package:dartz/dartz.dart';

import '../../../../core/errors/api_failure.dart';
import '../entities/otp_reason.dart';
import '../entities/otp_result.dart';

abstract interface class OtpRepo {
  Future<Either<ApiFailure, OtpResult>> verifyOtp({
    required OtpReason otpReason,
    required String pinCode,
  });
  Future<Either<ApiFailure, void>> sendOtp({
    required OtpReason otpReason,
  });
}
