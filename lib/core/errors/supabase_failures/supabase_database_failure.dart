import 'dart:developer';

import 'package:nextcart/core/errors/error_codes.dart';
import 'package:nextcart/core/errors/status_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_failure.dart';

class SupabaseDatabaseFailure extends SupabaseFailure {
  const SupabaseDatabaseFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);

  factory SupabaseDatabaseFailure.fromPostgrestException(PostgrestException exception) {
    // Postgrest exception typically contains 'code', 'message', 'details', 'hint'
    String friendlyMessage = _getFriendlyMessage(exception.message, exception.code);

    return SupabaseDatabaseFailure(
      friendlyMessage,
      exception.code ?? ErrorCodes.badRequest,
      StatusCode.badRequest400,
      exception.message,
    );
  }

  factory SupabaseDatabaseFailure.unknownException({
    required String unKnownExceptionMsg,
    String errMsg = "An unexpected database error occurred.",
  }) {
    log("SupabaseDatabaseFailure (Unknown): $unKnownExceptionMsg");
    return SupabaseDatabaseFailure(
      errMsg,
      ErrorCodes.unknownError,
      StatusCode.unknownError,
      unKnownExceptionMsg,
    );
  }

  static String _getFriendlyMessage(String originalMessage, String? code) {
    final msg = originalMessage.toLowerCase();
    
    // Postgres error codes: https://postgrest.org/en/stable/api.html#errors
    if (code == '23505') {
      return 'This record already exists. Please use different information.';
    } else if (code == '23503') {
      return 'This action cannot be completed because it relies on missing data.';
    } else if (code == '42P01') {
      return 'The requested data table could not be found.';
    }

    if (msg.contains('violates unique constraint')) {
      return 'This record already exists. Please use different information.';
    } else if (msg.contains('foreign key constraint')) {
      return 'This action cannot be completed because it relies on missing data.';
    }
    
    return 'An error occurred while processing your data. Please try again.';
  }
}
