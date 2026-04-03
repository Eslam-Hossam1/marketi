part of 'otp_cubit.dart';

abstract class OtpState {
  const OtpState();
}

class OtpInitial extends OtpState {
  const OtpInitial();
}

class OtpLoading extends OtpState {
  const OtpLoading();
}

class OtpFailure extends OtpState {
  final String errMsg;
  const OtpFailure({required this.errMsg});
}

class OtpShowResendButton extends OtpState {
  const OtpShowResendButton();
}

class VerifyOtpSuccess extends OtpState {
  const VerifyOtpSuccess();
}

class SendOtpSuccess extends OtpState {
  const SendOtpSuccess();
}
