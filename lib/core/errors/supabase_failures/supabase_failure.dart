import 'package:nextcart/core/errors/api_failure.dart';

abstract class SupabaseFailure extends ApiFailure {
  const SupabaseFailure(
    super.errMsg,
    super.errCode,
    super.statusCode, [
    super.serverErrorMessage,
  ]);
}
