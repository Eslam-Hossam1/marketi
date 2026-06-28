import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

// ── Initial ──────────────────────────────────────────────────────────────
final class FavoritesInitial extends FavoritesState {}

// ── Get Favorites States ─────────────────────────────────────────────────
final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {}

final class FavoritesEmpty extends FavoritesState {}

final class FavoritesFailure extends FavoritesState {
  final String errorMessage;

  const FavoritesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

// ── Add to Favorites States ──────────────────────────────────────────────
final class AddToFavoritesLoading extends FavoritesState {
  final String productId;

  const AddToFavoritesLoading({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class AddToFavoritesSuccess extends FavoritesState {
  final String productId;

  const AddToFavoritesSuccess({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class AddToFavoritesFailure extends FavoritesState {
  final String productId;
  final String errorMessage;

  const AddToFavoritesFailure({
    required this.productId,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [productId, errorMessage];
}

// ── Remove from Favorites States ─────────────────────────────────────────
final class RemoveFromFavoritesLoading extends FavoritesState {
  final String productId;

  const RemoveFromFavoritesLoading({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class RemoveFromFavoritesSuccess extends FavoritesState {
  final String productId;

  const RemoveFromFavoritesSuccess({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class RemoveFromFavoritesFailure extends FavoritesState {
  final String productId;
  final String errorMessage;

  const RemoveFromFavoritesFailure({
    required this.productId,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [productId, errorMessage];
}
