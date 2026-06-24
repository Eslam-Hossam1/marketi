import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/core/errors/status_code.dart';

abstract class ApiFailure extends Failure {
  final String errCode;
  final StatusCode statusCode;
  final String? serverErrorMessage;

  const ApiFailure(
    super.errMsg,
    this.errCode,
    this.statusCode,
    this.serverErrorMessage,
  );
}
