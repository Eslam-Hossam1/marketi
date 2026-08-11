import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import '../entities/checkout_entity.dart';
import '../params/checkout_params.dart';

abstract class CheckoutRepo {
  Future<Either<ApiFailure, CheckoutEntity>> createCheckout(CheckoutParams params);
}
