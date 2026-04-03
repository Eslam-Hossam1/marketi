import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/features/forgot_password/data/datasources/forgot_password_remote_data_source/forgot_password_remote_data_source.dart';
import 'package:marketi/features/forgot_password/data/models/reset_password_request_model.dart';
import 'package:marketi/features/forgot_password/data/models/send_code_request_model.dart';

class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ForgotPasswordRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<void> sendCode(SendCodeRequestModel requestModel) async {
    await _apiConsumer.post(
      EndPoints.resetPassCode,
      data: requestModel.toJson(),
    );
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel requestModel) async {
    await _apiConsumer.post(
      EndPoints.resetPassword,
      data: requestModel.toJson(),
    );
  }
}
