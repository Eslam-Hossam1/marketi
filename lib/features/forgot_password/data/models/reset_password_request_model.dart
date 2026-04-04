class ResetPasswordRequestModel {
  final String email;
  final String password;
  final String confirmPassword;

  ResetPasswordRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
