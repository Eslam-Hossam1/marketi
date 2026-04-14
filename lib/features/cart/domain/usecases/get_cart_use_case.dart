import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../entities/cart_entity.dart';
import '../repos/cart_repo.dart';

class GetCartUseCase implements NoParamUseCase<ApiFailure, CartEntity> {
  final CartRepo _cartRepo;

  GetCartUseCase(this._cartRepo);

  @override
  Future<Either<ApiFailure, CartEntity>> call() {
    return _cartRepo.getCart();
  }
}
