import 'package:equatable/equatable.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

// ── Get Cart States ──────────────────────────────────────────────────────
final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class CartEmpty extends CartState {}

// ── Add to Cart States ───────────────────────────────────────────────────
final class AddToCartLoading extends CartState {
  final int productId;

  const AddToCartLoading({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class AddToCartSuccess extends CartState {
  final int productId;

  const AddToCartSuccess({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class AddToCartFailure extends CartState {
  final int productId;
  final String errorMessage;

  const AddToCartFailure({
    required this.productId,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [productId, errorMessage];
}

// ── Remove from Cart States ──────────────────────────────────────────────
final class RemoveFromCartLoading extends CartState {
  final int productId;

  const RemoveFromCartLoading({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class RemoveFromCartSuccess extends CartState {
  final int productId;

  const RemoveFromCartSuccess({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class RemoveFromCartFailure extends CartState {
  final int productId;
  final String errorMessage;

  const RemoveFromCartFailure({
    required this.productId,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [productId, errorMessage];
}
