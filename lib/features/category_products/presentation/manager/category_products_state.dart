import 'package:equatable/equatable.dart';

sealed class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsFirstLoading extends CategoryProductsState {}

final class CategoryProductsSuccess extends CategoryProductsState {}

final class CategoryProductsLoadingMore extends CategoryProductsState {}

final class CategoryProductsFirstFetchFailure extends CategoryProductsState {
  final String errorMessage;

  const CategoryProductsFirstFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class CategoryProductsLoadingMoreFailure extends CategoryProductsState {
  final String errorMessage;

  const CategoryProductsLoadingMoreFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class CategoryProductsEmpty extends CategoryProductsState {}
