import 'package:equatable/equatable.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

// ── Initial ──────────────────────────────────────────────────────────────
final class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

// ── Get Favorites States ─────────────────────────────────────────────────
final class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

final class FavoritesSuccess extends FavoritesState {
  const FavoritesSuccess();
}

final class FavoritesEmpty extends FavoritesState {
  const FavoritesEmpty();
}

final class FavoritesFailure extends FavoritesState {
  final String errorMessage;

  const FavoritesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

// ── Toggle Favorite States ───────────────────────────────────────────────
/// Emitted optimistically when a product is added to or removed from favorites.
/// [isFavorite] reflects the NEW state after the toggle.
final class FavoriteToggled extends FavoritesState {
  final String productId;
  final bool isFavorite;

  const FavoriteToggled({
    required this.productId,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [productId, isFavorite];
}

/// Emitted when the API call fails and the optimistic update is rolled back.
/// [isFavorite] reflects the REVERTED (original) state.
final class FavoriteToggleReverted extends FavoritesState {
  final String productId;
  final bool isFavorite;
  final String errorMessage;

  const FavoriteToggleReverted({
    required this.productId,
    required this.isFavorite,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [productId, isFavorite, errorMessage];
}
