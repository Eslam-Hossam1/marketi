import 'package:marketi/core/networking/api_keys.dart';
import 'package:marketi/features/auth/domain/entities/auth_entity.dart';

class LoginModel extends AuthEntity {
  final String message;
  final String? userName;
  final String? userPhone;
  final String? userEmail;
  final String? userRole;
  final String? userImage;

  const LoginModel({
    required super.token,
    required this.message,
    this.userName,
    this.userPhone,
    this.userEmail,
    this.userRole,
    this.userImage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>?;
    return LoginModel(
      token: json[ApiKeys.accessToken] as String,
      message: json['message'] as String,
      userName: user?[ApiKeys.name] as String?,
      userPhone: user?[ApiKeys.phone] as String?,
      userEmail: user?[ApiKeys.email] as String?,
      userRole: user?['role'] as String?,
      userImage: user?['image'] as String?,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(token: token);
  }
}
