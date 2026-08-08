import 'package:dartz/dartz.dart';
import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/usecases/use_case.dart';
import '../repos/cart_repo.dart';

class ClearCartUseCase implements NoParamUseCase<ApiFailure, void> {
  final CartRepo _cartRepo;

  ClearCartUseCase(this._cartRepo);

  @override
  Future<Either<ApiFailure, void>> call() {
    return _cartRepo.clearCart();
  }
}
