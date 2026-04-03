import 'package:dartz/dartz.dart';
import 'package:marketi/core/usecases/use_case.dart';

import '../../../../core/errors/api_failure.dart';
import '../entities/otp_reason.dart';
import '../repos/otp_repo.dart';

class SendOtpUsecase implements UseCase<ApiFailure, void, SendOtpParams> {
  final OtpRepo _otpRepo;

  SendOtpUsecase({required OtpRepo otpRepo}) : _otpRepo = otpRepo;
  @override
  Future<Either<ApiFailure, void>> call(SendOtpParams params) async {
    return await _otpRepo.sendOtp(
      otpReason: params.otpReason,
    );
  }
}

class SendOtpParams {
  final OtpReason otpReason;

  SendOtpParams({required this.otpReason});
}
