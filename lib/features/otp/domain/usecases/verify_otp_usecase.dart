import 'package:dartz/dartz.dart';
import 'package:marketi/core/usecases/use_case.dart';

import '../../../../core/errors/api_failure.dart';
import '../entities/otp_reason.dart';
import '../entities/otp_result.dart';
import '../repos/otp_repo.dart';

class VerifyOtpUsecase
    implements UseCase<ApiFailure, OtpResult, VerifyOtpParams> {
  final OtpRepo _otpRepo;

  VerifyOtpUsecase({required OtpRepo otpRepo}) : _otpRepo = otpRepo;
  @override
  Future<Either<ApiFailure, OtpResult>> call(VerifyOtpParams params) async {
    return await _otpRepo.verifyOtp(
      otpReason: params.otpReason,
      pinCode: params.pinCode,
    );
  }
}

class VerifyOtpParams {
  final String pinCode;
  final OtpReason otpReason;

  VerifyOtpParams({required this.pinCode, required this.otpReason});
}
