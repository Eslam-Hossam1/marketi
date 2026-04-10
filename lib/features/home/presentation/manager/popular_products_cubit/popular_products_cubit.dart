import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/params/product_params.dart';
import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
import 'popular_products_state.dart';

class PopularProductsCubit extends Cubit<PopularProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  PopularProductsCubit(this._getProductsUseCase) : super(const PopularProductsInitial());

  List<ProductEntity>? products;

  Future<void> getPopularProducts() async {
    emit(const PopularProductsLoading());
    final result = await _getProductsUseCase(const ProductParams(popular: true));
    result.fold(
      (failure) =>
          emit(PopularProductsError(failure.serverErrorMessage ?? failure.errMsg)),
      (productsEntity) {
        products = productsEntity.list;
        emit(const PopularProductsLoaded());
      },
    );
  }
}
