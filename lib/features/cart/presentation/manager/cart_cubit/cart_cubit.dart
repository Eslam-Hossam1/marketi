import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/features/cart/domain/params/cart_product_params.dart';
import 'package:nextcart/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/update_cart_quantity_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;

  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
    this._removeFromCartUseCase,
    this._updateCartQuantityUseCase,
  ) : super(CartInitial());

  List<ProductEntity> cartProducts = [];
  final Set<String> _cartProductIds = {};
  final Map<String, int> _quantities = {};

  bool isInCart(String productId) => _cartProductIds.contains(productId);

  int getQuantity(String productId) => _quantities[productId] ?? 1;

  double get subtotal => cartProducts.fold(
        0.0,
        (sum, product) => sum + product.price * getQuantity(product.id),
      );

  Future<void> getCart({bool showLoading = true}) async {
    if (showLoading) emit(CartLoading());
    final result = await _getCartUseCase();
    result.fold(
      (failure) {
        if (showLoading) {
          emit(CartFailure(errorMessage: failure.errMsg));
        }
      },
      (cartEntity) {
        cartProducts = List.from(cartEntity.products);
        _cartProductIds
          ..clear()
          ..addAll(cartProducts.map((e) => e.id));
        _quantities
          ..clear()
          ..addAll(cartEntity.quantities);

        if (cartProducts.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartSuccess());
        }
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading(productId: productId));
    final result = await _addToCartUseCase(
      CartProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(
        AddToCartFailure(productId: productId, errorMessage: failure.errMsg),
      ),
      (_) async {
        _cartProductIds.add(productId);
        _quantities[productId] = 1;
        emit(AddToCartSuccess(productId: productId));
        // Sync with cart after success
        await getCart(showLoading: false);
      },
    );
  }

  Future<void> removeFromCart(String productId) async {
    emit(RemoveFromCartLoading(productId: productId));
    final result = await _removeFromCartUseCase(
      CartProductParams(productId: productId),
    );
    result.fold(
      (failure) => emit(
        RemoveFromCartFailure(
          productId: productId,
          errorMessage: failure.errMsg,
        ),
      ),
      (_) async {
        cartProducts.removeWhere((p) => p.id == productId);
        _cartProductIds.remove(productId);
        _quantities.remove(productId);
        emit(RemoveFromCartSuccess(productId: productId));
        if (cartProducts.isEmpty) {
          emit(CartEmpty());
        }
        // Sync with cart after success to ensure consistency
        await getCart(showLoading: false);
      },
    );
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    // If quantity drops to 0, remove the item entirely
    if (newQuantity <= 0) {
      await removeFromCart(productId);
      return;
    }

    // Optimistic update
    final previousQuantity = _quantities[productId] ?? 1;
    _quantities[productId] = newQuantity;
    emit(UpdateCartQuantityLoading(productId: productId));

    final result = await _updateCartQuantityUseCase(
      CartProductParams(productId: productId, quantity: newQuantity),
    );
    result.fold(
      (failure) {
        // Rollback on failure
        _quantities[productId] = previousQuantity;
        emit(UpdateCartQuantityFailure(
          productId: productId,
          errorMessage: failure.errMsg,
        ));
      },
      (_) {
        emit(UpdateCartQuantitySuccess(productId: productId));
      },
    );
  }
}
