import 'package:equatable/equatable.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsFirstLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {}

final class ProductsLoadingMore extends ProductsState {}

final class ProductsFirstFetchFailure extends ProductsState {
  final String errorMessage;

  const ProductsFirstFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class ProductsLoadingMoreFailure extends ProductsState {
  final String errorMessage;

  const ProductsLoadingMoreFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class ProductsEmpty extends ProductsState {}
