import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsCubit(this._getProductsUseCase) : super(ProductsInitial());

  List<ProductEntity> products = [];
  int skip = 0;
  final int limit = Constants.productsLimit;
  bool isLoading = false;
  bool hasMoreData = true;

  String? _brandId;
  String? _categoryId;

  Future<void> firstFetchProducts({String? brandId, String? categoryId}) async {
    _brandId = brandId;
    _categoryId = categoryId;
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(ProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> fetchMoreProducts() async {
    if (isLoading || !hasMoreData) return;
    emit(ProductsLoadingMore());
    await _fetchProducts();
  }

  Future<void> refreshProducts() async {
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(ProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    if (isLoading) return;
    isLoading = true;

    final result = await _getProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      brand: _brandId,
      category: _categoryId,
    ));

    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(ProductsFirstFetchFailure(errorMessage: failure.errMsg));
        } else {
          emit(ProductsLoadingMoreFailure(errorMessage: failure.errMsg));
        }
      },
      (productsEntity) {
        if (productsEntity.list.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(ProductsEmpty());
          return;
        }

        if (productsEntity.list.length < limit) {
          hasMoreData = false;
        }

        products.addAll(productsEntity.list);
        skip += limit;
        isLoading = false;
        emit(ProductsSuccess());
      },
    );
  }
}
