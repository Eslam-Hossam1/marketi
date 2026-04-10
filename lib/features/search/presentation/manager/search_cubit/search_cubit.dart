import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/features/search/domain/usecases/search_products_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProductsUseCase _searchProductsUseCase;

  SearchCubit(this._searchProductsUseCase) : super(const SearchInitial());

  List<ProductEntity> allProducts = [];
  int skip = 0;
  final int limit = 10;
  bool isFetching = false;
  String currentSearchQuery = "";

  Future<void> searchProducts(String query, {bool isLoadMore = false}) async {
    if (query.isEmpty) {
      allProducts.clear();
      skip = 0;
      emit(const SearchInitial());
      return;
    }

    if (isFetching) return;
    isFetching = true;

    if (!isLoadMore) {
      allProducts.clear();
      skip = 0;
      currentSearchQuery = query;
      emit(const SearchLoading());
    } else {
      emit(SearchPaginationLoading(allProducts));
    }

    final result = await _searchProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      search: currentSearchQuery,
    ));

    result.fold(
      (failure) {
        if (!isLoadMore) {
          emit(SearchError(failure.errMsg));
        } else {
          emit(SearchPaginationError(
            products: allProducts,
            message: failure.errMsg,
          ));
        }
      },
      (productsEntity) {
        allProducts.addAll(productsEntity.list);
        skip += limit;
        emit(SearchLoaded(
          products: List.from(allProducts),
          hasReachedMax: productsEntity.list.length < limit,
        ));
      },
    );

    isFetching = false;
  }
}
