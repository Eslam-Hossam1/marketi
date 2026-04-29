import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> getPaymentUrl(PaymentParams params);
}
