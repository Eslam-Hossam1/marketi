import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/features/search/domain/usecases/search_products_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProductsUseCase _searchProductsUseCase;

  SearchCubit(this._searchProductsUseCase) : super(SearchInitial());

  List<ProductEntity> products = [];
  int skip = 0;
  final int limit = Constants.productsLimit;
  bool isLoading = false;
  bool hasMoreData = true;
  String currentSearchQuery = "";

  Future<void> firstFetchSearch(String query) async {
    if (query.isEmpty) {
      products.clear();
      skip = 0;
      currentSearchQuery = "";
      emit(SearchInitial());
      return;
    }

    currentSearchQuery = query;
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(SearchFirstLoading());
    await _fetchSearch();
  }

  Future<void> fetchMoreSearch() async {
    if (isLoading || !hasMoreData || currentSearchQuery.isEmpty) return;
    emit(SearchLoadingMore());
    await _fetchSearch();
  }

  Future<void> _fetchSearch() async {
    if (isLoading) return;
    isLoading = true;

    final result = await _searchProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      search: currentSearchQuery,
    ));

    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(SearchFirstFetchFailure(errorMessage: failure.errMsg));
        } else {
          emit(SearchLoadingMoreFailure(errorMessage: failure.errMsg));
        }
      },
      (productsEntity) {
        if (productsEntity.list.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(SearchEmpty());
          return;
        }

        if (productsEntity.list.length < limit) {
          hasMoreData = false;
        }

        products.addAll(productsEntity.list);
        skip += limit;
        isLoading = false;
        emit(SearchSuccess());
      },
    );
  }
}
