import 'dart:developer';

import 'package:nextcart/core/errors/error_codes.dart';
import 'package:nextcart/core/errors/status_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_failure.dart';

class SupabaseAuthFailure extends SupabaseFailure {
  const SupabaseAuthFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);

  factory SupabaseAuthFailure.fromAuthException(AuthException exception) {
    int status = int.tryParse(exception.statusCode ?? '') ?? 400;
    String friendlyMessage = _getFriendlyMessage(exception.message);

    return SupabaseAuthFailure(
      friendlyMessage,
      ErrorCodes.badRequest,
      _getStatusCode(status),
      exception.message,
    );
  }

  factory SupabaseAuthFailure.unknownException({
    required String unKnownExceptionMsg,
    String errMsg = "An unexpected authentication error occurred.",
  }) {
    log("SupabaseAuthFailure (Unknown): $unKnownExceptionMsg");
    return SupabaseAuthFailure(
      errMsg,
      ErrorCodes.unknownError,
      StatusCode.unknownError,
      unKnownExceptionMsg,
    );
  }

  static String _getFriendlyMessage(String originalMessage) {
    final msg = originalMessage.toLowerCase();
    if (msg.contains('invalid login credentials')) {
      return 'The email or password you entered is incorrect.';
    } else if (msg.contains('user already registered')) {
      return 'An account with this email already exists. Try logging in instead.';
    } else if (msg.contains('email not confirmed')) {
      return 'Please confirm your email address. A new confirmation link has been sent to your email.';
    } else if (msg.contains('password should be at least')) {
      return 'Your password is too weak. Please use a stronger password.';
    } else if (msg.contains('rate limit')) {
      return 'You have made too many requests. Please try again later.';
    } else if (msg.contains('invalid email format')) {
      return 'Please enter a valid email address.';
    }
    // Fallback to the original message if it's already friendly enough, or a generic one
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
