import 'dart:async';

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

  static const _kDebounceDuration = Duration(milliseconds: 600);

  /// Single source of truth: product id → cart item (with live quantity).
  final Map<String, CartItemEntity> _cartItems = {};

  /// Last quantity confirmed by the backend. Used to rollback on failure.
  final Map<String, int> _committedQuantities = {};

  /// Per-product debounce timers — only one outstanding timer per product.
  final Map<String, Timer> _debounceTimers = {};

  // ── Public getters ────────────────────────────────────────────────────────

  List<CartItemEntity> get cartItems => _cartItems.values.toList();

  bool isInCart(String productId) => _cartItems.containsKey(productId);

  int getQuantity(String productId) => _cartItems[productId]?.quantity ?? 1;

  double get subtotal => _cartItems.values.fold(
        0.0,
        (sum, item) => sum + item.product.price * item.quantity,
      );

  // ── Get Cart ──────────────────────────────────────────────────────────────

  Future<void> getCart({bool showLoading = true}) async {
    if (showLoading) emit(CartLoading());
    final result = await _getCartUseCase();
    result.fold(
      (failure) {
        if (showLoading) emit(CartFailure(errorMessage: failure.errMsg));
      },
      (cartEntity) {
        _cartItems.clear();
        _committedQuantities.clear();
        for (final item in cartEntity.items) {
          _cartItems[item.product.id] = item;
          _committedQuantities[item.product.id] = item.quantity;
        }
        emit(_cartItems.isEmpty ? CartEmpty() : CartSuccess());
      },
    );
  }

  // ── Add to Cart ───────────────────────────────────────────────────────────

  Future<void> addToCart(ProductEntity product) async {
    emit(AddToCartLoading(productId: product.id));
    final result = await _addToCartUseCase(
      CartProductParams(productId: product.id),
    );
    result.fold(
      (failure) => emit(
        AddToCartFailure(productId: product.id, errorMessage: failure.errMsg),
      ),
      (_) {
        final wasEmpty = _cartItems.isEmpty;
        _cartItems[product.id] = CartItemEntity(product: product, quantity: 1);
        _committedQuantities[product.id] = 1;
        emit(AddToCartSuccess(productId: product.id));
        if (wasEmpty) emit(CartNotEmpty());
      },
    );
  }

  // ── Remove from Cart ──────────────────────────────────────────────────────

  Future<void> removeFromCart(String productId) async {
    // Cancel any pending debounce for this product before removing.
    _debounceTimers.remove(productId)?.cancel();

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
      (_) {
        _cartItems.remove(productId);
        _committedQuantities.remove(productId);
        emit(RemoveFromCartSuccess(productId: productId));
        if (_cartItems.isEmpty) emit(CartEmpty());
      },
    );
  }

  // ── Update Quantity (optimistic + debounced) ──────────────────────────────

  /// Instantly reflects the new quantity in the UI, then debounces the
  /// backend call. If the backend call fails, the quantity is rolled back
  /// to the last committed value and a failure state is emitted.
  void updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      _debounceTimers.remove(productId)?.cancel();
      removeFromCart(productId);
      return;
    }

    final currentItem = _cartItems[productId];
    if (currentItem == null) return;

    // --- Optimistic update: update the UI immediately ---
    _cartItems[productId] = CartItemEntity(
      product: currentItem.product,
      quantity: newQuantity,
    );
    // Emitting success instantly refreshes quantity + subtotal in the UI.
    emit(UpdateCartQuantitySuccess(productId: productId));

    // --- Debounce: reset the timer, only sync once user stops tapping ---
    _debounceTimers[productId]?.cancel();
    _debounceTimers[productId] = Timer(
      _kDebounceDuration,
      () => _commitQuantityUpdate(productId),
    );
  }

  /// Fired by the debounce timer. Sends the current quantity to the backend.
  Future<void> _commitQuantityUpdate(String productId) async {
    _debounceTimers.remove(productId);

    final currentItem = _cartItems[productId];
    if (currentItem == null) return;

    final targetQuantity = currentItem.quantity;
    final previousCommitted = _committedQuantities[productId] ?? targetQuantity;

    emit(UpdateCartQuantityLoading(productId: productId));

    final result = await _updateCartQuantityUseCase(
      CartProductParams(productId: productId, quantity: targetQuantity),
    );

    result.fold(
      (failure) {
        // If the user triggered a new debounce session while the request was
        // in-flight, do NOT rollback — the new timer will sync the correct
        // value. We still emit failure so a snackbar can be shown.
        if (!_debounceTimers.containsKey(productId)) {
          _cartItems[productId] = CartItemEntity(
            product: currentItem.product,
            quantity: previousCommitted,
          );
        }
        emit(UpdateCartQuantityFailure(
          productId: productId,
          errorMessage: failure.errMsg,
        ));
      },
      (_) {
        _committedQuantities[productId] = targetQuantity;
        emit(UpdateCartQuantitySuccess(productId: productId));
      },
    );
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  Future<void> close() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    _debounceTimers.clear();
    return super.close();
  }
}
