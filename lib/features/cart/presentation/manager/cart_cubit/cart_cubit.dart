import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/features/cart/domain/params/cart_product_params.dart';
import 'package:marketi/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;

  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
    this._removeFromCartUseCase,
  ) : super(CartInitial());

  List<ProductEntity> cartProducts = [];
  final Set<int> _cartProductIds = {};

  bool isInCart(int productId) => _cartProductIds.contains(productId);

  double get subtotal =>
      cartProducts.fold(0.0, (sum, product) => sum + product.price);

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await _getCartUseCase();
    result.fold(
      (failure) => emit(CartFailure(errorMessage: failure.errMsg)),
      (cartEntity) {
        cartProducts = List.from(cartEntity.products);
        _cartProductIds
          ..clear()
          ..addAll(cartProducts.map((e) => e.id));

        if (cartProducts.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartSuccess());
        }
      },
    );
  }

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoading(productId: productId));
    final result = await _addToCartUseCase(
      CartProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(AddToCartFailure(
        productId: productId,
        errorMessage: failure.errMsg,
      )),
      (_) {
        _cartProductIds.add(productId);
        emit(AddToCartSuccess(productId: productId));
      },
    );
  }

  Future<void> removeFromCart(int productId) async {
    emit(RemoveFromCartLoading(productId: productId));
    final result = await _removeFromCartUseCase(
      CartProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(RemoveFromCartFailure(
        productId: productId,
        errorMessage: failure.errMsg,
      )),
      (_) {
        cartProducts.removeWhere((p) => p.id == productId);
        _cartProductIds.remove(productId);
        if (cartProducts.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(RemoveFromCartSuccess(productId: productId));
        }
      },
    );
  }
}
