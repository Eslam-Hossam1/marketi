import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/otp_reason.dart';
import '../../../domain/usecases/send_otp_usecase.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final OtpReason otpReason;
  String pinCode = '';
  OtpCubit({
    required VerifyOtpUsecase verifyOtpUsecase,
    required SendOtpUsecase sendOtpUsecase,
    required this.otpReason,
  })  : _sendOtpUsecase = sendOtpUsecase,
        _verifyOtpUsecase = verifyOtpUsecase,
        super(const OtpInitial());

  Future<void> sendVerificationCode() async {
    emit(const OtpLoading());
    var otpResult = await _sendOtpUsecase.call(
      SendOtpParams(
        otpReason: otpReason,
      ),
    );
    otpResult.fold(
      (failure) => emit(
        OtpFailure(
          errMsg: failure.errMsg,
        ),
      ),
      (success) => emit(
        const SendOtpSuccess(),
      ),
    );
  }

  void showResendButton() => emit(const OtpShowResendButton());
  void showSendOtpSuccess() => emit(const SendOtpSuccess());
  Future<void> verfiyVerificationCode() async {
    emit(const OtpLoading());
    var otpResult = await _verifyOtpUsecase.call(
      VerifyOtpParams(
        pinCode: pinCode,
        otpReason: otpReason,
      ),
    );

    otpResult.fold(
      (failure) => emit(
        OtpFailure(
          errMsg: failure.errMsg,
        ),
      ),
      (otpResult) async {
        await otpReason.onSuccess(otpResult);
        emit(
          const VerifyOtpSuccess(),
        );
      },
    );
  }
}
