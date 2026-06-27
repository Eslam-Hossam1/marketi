import 'dart:developer';

import 'package:nextcart/core/errors/error_codes.dart';
import 'package:nextcart/core/errors/status_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_failure.dart';

class SupabaseStorageFailure extends SupabaseFailure {
  const SupabaseStorageFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);

  factory SupabaseStorageFailure.fromStorageException(StorageException exception) {
    int status = int.tryParse(exception.statusCode ?? '') ?? 400;
    String friendlyMessage = _getFriendlyMessage(exception.message);

    return SupabaseStorageFailure(
      friendlyMessage,
      ErrorCodes.badRequest,
      _getStatusCode(status),
      exception.message,
    );
  }

  factory SupabaseStorageFailure.unknownException({
    required String unKnownExceptionMsg,
    String errMsg = "An unexpected storage error occurred.",
  }) {
    log("SupabaseStorageFailure (Unknown): $unKnownExceptionMsg");
    return SupabaseStorageFailure(
      errMsg,
      ErrorCodes.unknownError,
      StatusCode.unknownError,
      unKnownExceptionMsg,
    );
  }

  static String _getFriendlyMessage(String originalMessage) {
    final msg = originalMessage.toLowerCase();
    if (msg.contains('not found') || msg.contains('object not found')) {
      return 'The requested file could not be found.';
    } else if (msg.contains('unauthorized') || msg.contains('access denied')) {
      return 'You do not have permission to access this file.';
    } else if (msg.contains('size limit')) {
      return 'The file you are trying to upload is too large.';
    } else if (msg.contains('mime type')) {
      return 'This file type is not supported.';
    }
    return originalMessage;
  }

  static StatusCode _getStatusCode(int status) {
    switch (status) {
      case 400:
        return StatusCode.badRequest400;
      case 401:
        return StatusCode.unauthorized401;
      case 403:
        return StatusCode.forbidden403;
      case 404:
        return StatusCode.notFound404;
      case 500:
        return StatusCode.internalServerError500;
      default:
        return StatusCode.unknownError;
    }
  }
}
