class ApiErrorModel {
  bool? success;
  int? statusCode;
  String? message;

  ApiErrorModel({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      success: json['Success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      message: json['Message'] as String?,
    );
  }
}
