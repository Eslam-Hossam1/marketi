import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../params/cart_product_params.dart';
import '../repos/cart_repo.dart';

class RemoveFromCartUseCase
    implements UseCase<ApiFailure, void, CartProductParams> {
  final CartRepo _cartRepo;

  RemoveFromCartUseCase(this._cartRepo);

  @override
  Future<Either<ApiFailure, void>> call(CartProductParams params) {
    return _cartRepo.removeFromCart(params);
  }
}
