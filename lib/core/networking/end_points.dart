abstract class EndPoints {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";

  // Auth
  static const String signIn = "/auth/signIn";
  static const String signUp = "/auth/signUp";
  static const String sendForgotPassowrdOtp = "/auth/resetPassCode";
  static const String verifyForgotPasswordOtp = "/auth/activeResetPass";
  static const String resetPassword = "/auth/resetPassword";

  // Profile
  static const String userData = "/portfoilo/userData";
  static const String editUserData = "/portfoilo/editUserData";
  static const String addImage = "/portfoilo/addImage";
  // Home
  static const String brands = "/home/brands";
  static const String categories = "/home/categories";
  static const String products = "/home/products";
}
