import 'package:marketi/core/networking/api_keys.dart';
import 'package:marketi/features/auth/domain/params/sign_up_params.dart';

class SignUpRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory SignUpRequestModel.fromParams(SignUpParams params) {
    return SignUpRequestModel(
      name: params.name,
      phone: params.phone,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.phone: phone,
      ApiKeys.email: email,
      ApiKeys.password: password,
      ApiKeys.confirmPassword: confirmPassword,
    };
  }
}
