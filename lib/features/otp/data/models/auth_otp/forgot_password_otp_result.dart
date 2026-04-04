import '../../../../../core/networking/api_keys.dart';
import '../../../domain/entities/otp_result.dart';

class ForgotPasswordOtpResult implements OtpResult {
  final String accessToken;

  const ForgotPasswordOtpResult({
    required this.accessToken,
  });

  factory ForgotPasswordOtpResult.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordOtpResult(
      accessToken: json[ApiKeys.data][ApiKeys.accessToken],
    );
  }
}
