import 'package:marketi/core/entities/product_entity.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchPaginationLoading extends SearchState {
  final List<ProductEntity> products;
  const SearchPaginationLoading(this.products);
}

class SearchLoaded extends SearchState {
  final List<ProductEntity> products;
  final bool hasReachedMax;
  const SearchLoaded({required this.products, required this.hasReachedMax});
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}

class SearchPaginationError extends SearchState {
  final List<ProductEntity> products;
  final String message;
  const SearchPaginationError({required this.products, required this.message});
}
