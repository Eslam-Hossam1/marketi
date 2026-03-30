import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marketi/core/errors/api_error_model/api_error_model.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/errors/error_codes.dart';
import 'package:marketi/core/errors/status_code.dart';

class DioApiFailure extends ApiFailure {
  DioApiFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);
  factory DioApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioApiFailure(
          "Connection timeout with ApiServer",
          ErrorCodes.connectionTimeout,
          StatusCode.connectTimeout,
        );
      case DioExceptionType.sendTimeout:
        return DioApiFailure(
          "Send timeout with ApiServer",
          ErrorCodes.sendTimeout,
          StatusCode.sendTimeout,
        );

      case DioExceptionType.receiveTimeout:
        return DioApiFailure(
          "Receive timeout with ApiServer",
          ErrorCodes.receiveTimeout,
          StatusCode.receiveTimeout,
        );

      case DioExceptionType.badCertificate:
        return DioApiFailure(
          "Bad Certificate",
          ErrorCodes.badCertificate,
          StatusCode.badCertificate,
        );

      case DioExceptionType.badResponse:
        return DioApiFailure.frombadResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return DioApiFailure(
          "Request to ApiServer was canceld",
          ErrorCodes.requestCancelled,
          StatusCode.cancel,
        );
      case DioExceptionType.connectionError:
        return DioApiFailure(
          "No Internet Connection",
          ErrorCodes.noInternetConnection,
          StatusCode.noInternetConnection,
        );
      case DioExceptionType.unknown:
        return DioApiFailure(
          "Unexpected Error, Please try again",
          ErrorCodes.unknownError,
          StatusCode.unknownError,
        );
    }
  }
  factory DioApiFailure.frombadResponse(int status, dynamic responseBody) {
    if (responseBody != null && responseBody is Map<String, dynamic>) {
      ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(responseBody);
      return getFailureFromStatusCode(status, apiErrorModel.message);
    } else {
      return getFailureFromStatusCode(status, null);
    }
  }

  static DioApiFailure getFailureFromStatusCode(
    int status,
    String? serverErrorMessage,
  ) {
    switch (status) {
      case 400:
        return DioApiFailure(
          'Bad Request',
          ErrorCodes.badRequest,
          StatusCode.badRequest400,
          serverErrorMessage,
        );

      case 401:
        return DioApiFailure(
          'Unauthorized',
          ErrorCodes.unauthorized,
          StatusCode.unauthorized401,
          serverErrorMessage,
        );

      case 403:
        return DioApiFailure(
          'Forbidden',
          ErrorCodes.forbidden,
          StatusCode.forbidden403,
          serverErrorMessage,
        );

      case 404:
        return DioApiFailure(
          'Not Found',
          ErrorCodes.notFound,
          StatusCode.notFound404,
          serverErrorMessage,
        );

      case 500:
        return DioApiFailure(
          'Internal Server Error',
          ErrorCodes.internalServerError,
          StatusCode.internalServerError500,
          serverErrorMessage,
        );

      case 502:
        return DioApiFailure(
          'Bad Gateway',
          ErrorCodes.badGateway,
          StatusCode.badGateway502,
          serverErrorMessage,
        );

      case 503:
        return DioApiFailure(
          'Service Unavailable',
          ErrorCodes.serviceUnavailable,
          StatusCode.serviceUnavailable503,
          serverErrorMessage,
        );

      case 504:
        return DioApiFailure(
          'Gateway Timeout',
          ErrorCodes.gatewayTimeout,
          StatusCode.gatewayTimeout504,
          serverErrorMessage,
        );

      default:
        return DioApiFailure(
          'Unknown Error',
          ErrorCodes.unknownError,
          StatusCode.unknownError,
          serverErrorMessage,
        );
    }
  }

  factory DioApiFailure.unknownException({
    required String unKnownExceptionMsg,
    String errMsg = "UnKnown Error",
  }) {
    log("UnKnownFailure: $unKnownExceptionMsg");
    return DioApiFailure(
      errMsg,
      ErrorCodes.unknownError,
      StatusCode.unknownError,
    );
  }
  factory DioApiFailure.unknown(String errMsg) =>
      DioApiFailure(errMsg, ErrorCodes.unknownError, StatusCode.unknownError);
}
