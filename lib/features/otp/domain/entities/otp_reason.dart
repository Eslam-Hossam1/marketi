import 'otp_result.dart';
import 'otp_to_go_on_success.dart';

abstract interface class OtpReason<T extends OtpResult> {
  final String verifyOtpEndpoint;
  final String sendOtpEndpoint;
  final String email;
  final OtpToGoOnSuccess toGoOnSuccess;
  final bool sendOtpOnOpening;
  T resultBuilder(Map<String, dynamic> json);
  Future<void> onSuccess(T otpResult);

  OtpReason({
    required this.toGoOnSuccess,
    required this.email,
    required this.verifyOtpEndpoint,
    required this.sendOtpEndpoint,
    required this.sendOtpOnOpening,
  });
}
