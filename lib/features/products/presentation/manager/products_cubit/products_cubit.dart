import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsCubit(this._getProductsUseCase) : super(const ProductsInitial());

  List<ProductEntity> allProducts = [];
  int skip = 0;
  final int limit = 10;
  bool isFetching = false;

  Future<void> getProducts({String? brandId, String? categoryId}) async {
    if (isFetching) return;
    isFetching = true;

    if (skip == 0) {
      emit(const ProductsLoading());
    } else {
      emit(ProductsPaginationLoading(allProducts));
    }

    final result = await _getProductsUseCase(ProductParams(
      skip: skip,
      limit: limit,
      brand: brandId,
      category: categoryId,
    ));

    result.fold(
      (failure) {
        if (skip == 0) {
          emit(ProductsError(failure.errMsg));
        } else {
          emit(ProductsPaginationError(
            products: allProducts,
            message: failure.errMsg,
          ));
        }
      },
      (productsEntity) {
        allProducts.addAll(productsEntity.list);
        skip += limit;
        emit(ProductsLoaded(
          products: List.from(allProducts),
          hasReachedMax: productsEntity.list.length < limit,
        ));
      },
    );

    isFetching = false;
  }

  void resetPagination() {
    allProducts.clear();
    skip = 0;
    isFetching = false;
  }
}
