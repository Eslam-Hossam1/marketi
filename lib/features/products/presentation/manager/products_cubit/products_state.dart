import 'package:marketi/core/entities/product_entity.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsPaginationLoading extends ProductsState {
  final List<ProductEntity> products;
  const ProductsPaginationLoading(this.products);
}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;
  final bool hasReachedMax;
  const ProductsLoaded({required this.products, required this.hasReachedMax});
}

class ProductsError extends ProductsState {
  final String message;
  const ProductsError(this.message);
}

class ProductsPaginationError extends ProductsState {
  final List<ProductEntity> products;
  final String message;
  const ProductsPaginationError({required this.products, required this.message});
}
