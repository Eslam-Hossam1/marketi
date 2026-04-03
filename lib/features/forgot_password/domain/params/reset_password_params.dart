class ResetPasswordParams {
  final String email;
  final String password;
  final String confirmPassword;

  ResetPasswordParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
