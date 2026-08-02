import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/error_codes.dart';
import 'package:nextcart/core/errors/status_code.dart';

class StripeFailure extends ApiFailure {
  const StripeFailure(super.errMsg, super.errCode, super.statusCode, [super.serverErrorMessage]);
}

class StripeService {
  Future<Either<ApiFailure, void>> presentPaymentSheet({
    required String clientSecret,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'NextCart',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      return const Right(null);
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return const Left(StripeFailure('Payment cancelled by user', ErrorCodes.unknownError, StatusCode.unknownError));
      }
      return Left(StripeFailure(e.error.localizedMessage ?? 'Payment failed', ErrorCodes.unknownError, StatusCode.unknownError, e.error.message));
    } catch (e) {
      return Left(StripeFailure('An unexpected error occurred during payment', ErrorCodes.unknownError, StatusCode.unknownError, e.toString()));
    }
  }
}
