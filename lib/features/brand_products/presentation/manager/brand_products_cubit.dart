import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/features/brand_products/domain/usecases/get_brand_products_use_case.dart';
import 'brand_products_state.dart';

class BrandProductsCubit extends Cubit<BrandProductsState> {
  final GetBrandProductsUseCase _getBrandProductsUseCase;

  BrandProductsCubit(this._getBrandProductsUseCase) : super(BrandProductsInitial());

  List<ProductEntity> products = [];
  int skip = 0;
  final int limit = Constants.productsLimit;
  bool isLoading = false;
  bool hasMoreData = true;
  String currentBrand = "";

  Future<void> firstFetchProducts(String brand) async {
    currentBrand = brand;
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(BrandProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> fetchMoreProducts() async {
    if (isLoading || !hasMoreData) return;
    emit(BrandProductsLoadingMore());
    await _fetchProducts();
  }

  Future<void> refreshProducts() async {
    products.clear();
    skip = 0;
    hasMoreData = true;
    emit(BrandProductsFirstLoading());
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    if (isLoading) return;
    isLoading = true;

    final result = await _getBrandProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      brand: currentBrand,
    ));

    result.fold(
      (failure) {
        isLoading = false;
        if (products.isEmpty) {
          emit(BrandProductsFirstFetchFailure(errorMessage: failure.errMsg));
        } else {
          emit(BrandProductsLoadingMoreFailure(errorMessage: failure.errMsg));
        }
      },
      (productsEntity) {
        if (productsEntity.list.isEmpty && products.isEmpty) {
          hasMoreData = false;
          isLoading = false;
          emit(BrandProductsEmpty());
          return;
        }

        if (productsEntity.list.length < limit) {
          hasMoreData = false;
        }

        products.addAll(productsEntity.list);
        skip += limit;
        isLoading = false;
        emit(BrandProductsSuccess());
      },
    );
  }
}
