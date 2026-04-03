import '../../../../../core/networking/end_points.dart';
import '../../../../../core/routing/routes_paths.dart';
import '../../../domain/entities/otp_reason.dart';
import '../../../domain/entities/otp_to_go_on_success.dart';
import 'forgot_password_otp_result.dart';

class ForgotPasswordOtpReason implements OtpReason<ForgotPasswordOtpResult> {
  ForgotPasswordOtpReason({
    required this.email,
  }) : toGoOnSuccess = OtpToGoOnSuccess(
          toGoRoutePath: RoutePaths.resetPassword,
          toGoExtra: email,
        );
  @override
  final String email;

  @override
  final String sendOtpEndpoint = EndPoints.sendForgotPassowrdOtp;

  @override
  final String verifyOtpEndpoint = EndPoints.verifyForgotPasswordOtp;

  @override
  final OtpToGoOnSuccess toGoOnSuccess;

  @override
  final bool sendOtpOnOpening = false;

  @override
  ForgotPasswordOtpResult resultBuilder(Map<String, dynamic> json) =>
      ForgotPasswordOtpResult.fromJson(json);

  @override
  Future<void> onSuccess(ForgotPasswordOtpResult otpResult) async {}
}
