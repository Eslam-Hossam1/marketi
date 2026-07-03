import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/entities/product_entity.dart';
import 'package:nextcart/features/cart/domain/entities/cart_item_entity.dart';
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

  final Map<String, CartItemEntity> _cartItems = {};

  List<CartItemEntity> get cartItems => _cartItems.values.toList();

  bool isInCart(String productId) => _cartItems.containsKey(productId);

  int getQuantity(String productId) => _cartItems[productId]?.quantity ?? 1;

  double get subtotal => _cartItems.values.fold(
        0.0,
        (sum, item) => sum + item.product.price * item.quantity,
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
        _cartItems.clear();
        for (final item in cartEntity.items) {
          _cartItems[item.product.id] = item;
        }

        if (_cartItems.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartSuccess());
        }
      },
    );
  }

  Future<void> addToCart(ProductEntity product) async {
    emit(AddToCartLoading(productId: product.id));
    final result = await _addToCartUseCase(
      CartProductParams(productId: product.id),
    );
    result.fold(
      (failure) => emit(
        AddToCartFailure(productId: product.id, errorMessage: failure.errMsg),
      ),
      (_) async {
        _cartItems[product.id] = CartItemEntity(product: product, quantity: 1);
        emit(AddToCartSuccess(productId: product.id));
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
        _cartItems.remove(productId);
        emit(RemoveFromCartSuccess(productId: productId));
        if (_cartItems.isEmpty) {
          emit(CartEmpty());
        }
      },
    );
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    // If quantity drops to 0, remove the item entirely
    if (newQuantity <= 0) {
      await removeFromCart(productId);
      return;
    }

    final currentItem = _cartItems[productId];
    if (currentItem == null) return;

    // Optimistic update
    final previousQuantity = currentItem.quantity;
    _cartItems[productId] = CartItemEntity(
      product: currentItem.product,
      quantity: newQuantity,
    );
    emit(UpdateCartQuantityLoading(productId: productId));

    final result = await _updateCartQuantityUseCase(
      CartProductParams(productId: productId, quantity: newQuantity),
    );
    result.fold(
      (failure) {
        // Rollback on failure
        _cartItems[productId] = CartItemEntity(
          product: currentItem.product,
          quantity: previousQuantity,
        );
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
