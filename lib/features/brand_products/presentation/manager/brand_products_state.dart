import 'package:equatable/equatable.dart';

sealed class BrandProductsState extends Equatable {
  const BrandProductsState();

  @override
  List<Object> get props => [];
}

final class BrandProductsInitial extends BrandProductsState {}

final class BrandProductsFirstLoading extends BrandProductsState {}

final class BrandProductsSuccess extends BrandProductsState {}

final class BrandProductsLoadingMore extends BrandProductsState {}

final class BrandProductsFirstFetchFailure extends BrandProductsState {
  final String errorMessage;

  const BrandProductsFirstFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class BrandProductsLoadingMoreFailure extends BrandProductsState {
  final String errorMessage;

  const BrandProductsLoadingMoreFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class BrandProductsEmpty extends BrandProductsState {}
