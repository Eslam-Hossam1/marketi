import '../../../../core/networking/api_consumer.dart';
import '../../../../core/networking/api_keys.dart';
import '../../domain/entities/otp_reason.dart';
import '../../domain/entities/otp_result.dart';
import 'otp_remote_data_source.dart';

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final ApiConsumer _apiConsumer;

  OtpRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<void> sendOtp({required OtpReason<OtpResult> otpReason}) async {
    await _apiConsumer.post(
      otpReason.sendOtpEndpoint,
      data: {
        ApiKeys.email: otpReason.email,
      },
    );
  }

  @override
  Future<OtpResult> verifyOtp(
      {required OtpReason<OtpResult> otpReason,
      required String pinCode}) async {
    final response = await _apiConsumer.post(
      otpReason.verifyOtpEndpoint,
      data: {
        ApiKeys.email: otpReason.email,
        ApiKeys.otp: pinCode,
      },
    );
    OtpResult otpResult = otpReason.resultBuilder(
      response as Map<String, dynamic>,
    );
    return otpResult;
  }
}
