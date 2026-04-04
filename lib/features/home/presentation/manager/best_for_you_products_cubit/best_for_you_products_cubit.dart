import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/params/product_params.dart';
import '../../../domain/usecases/get_products_use_case.dart';
import 'best_for_you_products_state.dart';

class BestForYouProductsCubit extends Cubit<BestForYouProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  BestForYouProductsCubit(this._getProductsUseCase) : super(const BestForYouProductsInitial());

  List<ProductEntity>? products;

  Future<void> getBestForYouProducts() async {
    emit(const BestForYouProductsLoading());
    final result = await _getProductsUseCase(const ProductParams(rating: 4.5));
    result.fold(
      (failure) =>
          emit(BestForYouProductsError(failure.serverErrorMessage ?? failure.errMsg)),
      (productsEntity) {
        products = productsEntity.list;
        emit(const BestForYouProductsLoaded());
      },
    );
  }
}
