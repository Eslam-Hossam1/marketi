import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../entities/checkout_response_entity.dart';
import '../params/checkout_params.dart';
import '../repos/checkout_repo.dart';

class CreateCheckoutUseCase
    implements UseCase<ApiFailure, CheckoutResponseEntity, CheckoutParams> {
  final CheckoutRepo _checkoutRepo;

  CreateCheckoutUseCase(this._checkoutRepo);

  @override
  Future<Either<ApiFailure, CheckoutResponseEntity>> call(CheckoutParams params) {
    return _checkoutRepo.createCheckout(params);
  }
}
