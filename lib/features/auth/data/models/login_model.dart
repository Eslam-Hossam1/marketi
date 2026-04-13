import 'package:marketi/core/networking/api_keys.dart';
import 'package:marketi/features/auth/domain/entities/auth_entity.dart';

class LoginModel extends AuthEntity {
  final String message;

  const LoginModel({required super.token, required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json[ApiKeys.accessToken] as String,
      message: json['message'] as String,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(token: token);
  }
}
