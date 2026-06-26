import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/status_code.dart';

abstract class SupabaseFailure extends ApiFailure {
  const SupabaseFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);
}
