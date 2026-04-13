import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_product_details_usecase.dart';
import '../../../domain/params/product_details_params.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final int productId;

  ProductDetailsCubit(this.productId, this._getProductDetailsUseCase) : super(ProductDetailsInitial());

  Future<void> getProductDetails() async {
    emit(ProductDetailsLoading());
    final result = await _getProductDetailsUseCase(ProductDetailsParams(productId: productId));
    result.fold(
      (failure) => emit(ProductDetailsFailure(failure.errMsg)),
      (productDetails) => emit(ProductDetailsSuccess(productDetails)),
    );
  }
}
