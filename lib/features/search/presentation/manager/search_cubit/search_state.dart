import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchFirstLoading extends SearchState {}

final class SearchSuccess extends SearchState {}

final class SearchLoadingMore extends SearchState {}

final class SearchFirstFetchFailure extends SearchState {
  final String errorMessage;

  const SearchFirstFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class SearchLoadingMoreFailure extends SearchState {
  final String errorMessage;

  const SearchLoadingMoreFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class SearchEmpty extends SearchState {}
