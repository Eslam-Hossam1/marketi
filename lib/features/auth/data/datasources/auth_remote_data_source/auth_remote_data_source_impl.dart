import 'package:nexcart/core/networking/api_consumer.dart';
import 'package:nexcart/core/networking/end_points.dart';
import 'package:nexcart/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:nexcart/features/auth/data/models/login_model.dart';
import 'package:nexcart/features/auth/data/models/login_request_model.dart';
import 'package:nexcart/features/auth/data/models/sign_up_model.dart';
import 'package:nexcart/features/auth/data/models/sign_up_request_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<LoginModel> login(LoginRequestModel requestModel) async {
    final response = await _apiConsumer.post(
      EndPoints.signIn,
      data: requestModel.toJson(),
    );
    return LoginModel.fromJson(response);
  }

  @override
  Future<SignUpModel> signUp(SignUpRequestModel requestModel) async {
    final response = await _apiConsumer.post(
      EndPoints.signUp,
      data: requestModel.toJson(),
    );
    return SignUpModel.fromJson(response);
  }
}
