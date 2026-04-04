import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/params/product_params.dart';
import '../../../domain/usecases/get_products_use_case.dart';
import 'buy_again_products_state.dart';

class BuyAgainProductsCubit extends Cubit<BuyAgainProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  BuyAgainProductsCubit(this._getProductsUseCase) : super(const BuyAgainProductsInitial());

  List<ProductEntity>? products;

  Future<void> getBuyAgainProducts() async {
    emit(const BuyAgainProductsLoading());
    final result = await _getProductsUseCase(const ProductParams(skip: 10));
    result.fold(
      (failure) =>
          emit(BuyAgainProductsError(failure.serverErrorMessage ?? failure.errMsg)),
      (productsEntity) {
        products = productsEntity.list;
        emit(const BuyAgainProductsLoaded());
      },
    );
  }
}
