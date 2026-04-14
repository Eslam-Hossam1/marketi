import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_failure.dart';
import '../entities/cart_entity.dart';
import '../params/cart_product_params.dart';

abstract class CartRepo {
  Future<Either<ApiFailure, CartEntity>> getCart();
  Future<Either<ApiFailure, void>> addToCart(CartProductParams params);
  Future<Either<ApiFailure, void>> removeFromCart(CartProductParams params);
}
