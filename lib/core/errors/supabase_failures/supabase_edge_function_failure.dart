import 'package:nextcart/core/errors/error_codes.dart';
import 'package:nextcart/core/errors/status_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_failure.dart';

class SupabaseEdgeFunctionFailure extends SupabaseFailure {
  const SupabaseEdgeFunctionFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);

  factory SupabaseEdgeFunctionFailure.fromFunctionException(FunctionException exception) {
    return SupabaseEdgeFunctionFailure(
      _getFriendlyMessage(exception.reasonPhrase),
      ErrorCodes.badRequest, // We might not have a specific code, fallback to bad request
      StatusCode.badRequest400,
      exception.details.toString(),
    );
  }

  factory SupabaseEdgeFunctionFailure.unknownException({
    required String unKnownExceptionMsg,
    String errMsg = "An unexpected error occurred while processing your request.",
  }) {
    return SupabaseEdgeFunctionFailure(
      errMsg,
      ErrorCodes.unknownError,
      StatusCode.unknownError,
      unKnownExceptionMsg,
    );
  }

  static String _getFriendlyMessage(String? reason) {
    if (reason == null) {
      return 'An error occurred while processing your request. Please try again.';
    }
    
    final msg = reason.toLowerCase();
    if (msg.contains('unauthorized')) {
      return 'Your session has expired or you are unauthorized. Please login again.';
    } else if (msg.contains('cart is empty')) {
      return 'Your cart is empty. Add some items to proceed.';
    }
    
    return 'An error occurred while processing your request. Please try again.';
  }
}
