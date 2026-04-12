import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/features/category_products/domain/usecases/get_category_products_use_case.dart';
import 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final GetCategoryProductsUseCase _getCategoryProductsUseCase;

  CategoryProductsCubit(this._getCategoryProductsUseCase) : super(CategoryProductsInitial());

  List<ProductEntity> products = [];
  int skip = 0;
  final int limit = Constants.productsLimit;
  bool isLoading = false;
  bool hasMoreData = true;
  String categorySlug = "";

  Future<void> firstFetchProducts(String slug) async {
    categorySlug = slug;
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(CategoryProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> fetchMoreProducts() async {
    if (isLoading || !hasMoreData) return;
    emit(CategoryProductsLoadingMore());
    await _fetchProducts();
  }

  Future<void> refreshProducts() async {
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(CategoryProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    if (isLoading) return;
    isLoading = true;

    final result = await _getCategoryProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      category: categorySlug,
    ));

    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(CategoryProductsFirstFetchFailure(errorMessage: failure.errMsg));
        } else {
          emit(CategoryProductsLoadingMoreFailure(errorMessage: failure.errMsg));
        }
      },
      (productsEntity) {
        if (productsEntity.list.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(CategoryProductsEmpty());
          return;
        }

        if (productsEntity.list.length < limit) {
          hasMoreData = false;
        }

        products.addAll(productsEntity.list);
        skip += limit;
        isLoading = false;
        emit(CategoryProductsSuccess());
      },
    );
  }
}
