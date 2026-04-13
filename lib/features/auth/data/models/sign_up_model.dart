import 'package:marketi/core/networking/api_keys.dart';
import 'package:marketi/features/auth/domain/entities/auth_entity.dart';

class SignUpModel extends AuthEntity {
  final String message;


  const SignUpModel({
    required super.token,
    required this.message,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      token: json[ApiKeys.accessToken] as String,
      message: json['message'] as String,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(token: token);
  }
}
