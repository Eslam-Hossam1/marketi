import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../params/checkout_params.dart';
import '../repos/orders_repo.dart';

class CreateCheckoutUseCase implements UseCase<ApiFailure, void, CheckoutParams> {
  final OrdersRepo _ordersRepo;

  CreateCheckoutUseCase(this._ordersRepo);

  @override
  Future<Either<ApiFailure, void>> call(CheckoutParams params) {
    return _ordersRepo.createCheckout(params);
  }
}
