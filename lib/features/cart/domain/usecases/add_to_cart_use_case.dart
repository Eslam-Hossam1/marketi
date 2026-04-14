import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../params/cart_product_params.dart';
import '../repos/cart_repo.dart';

class AddToCartUseCase implements UseCase<ApiFailure, void, CartProductParams> {
  final CartRepo _cartRepo;

  AddToCartUseCase(this._cartRepo);

  @override
  Future<Either<ApiFailure, void>> call(CartProductParams params) {
    return _cartRepo.addToCart(params);
  }
}
