import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/brand_entity.dart';
import 'package:marketi/features/brands/domain/usecases/get_brands_use_case.dart';
import 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final GetBrandsUseCase _getBrandsUseCase;

  BrandsCubit(this._getBrandsUseCase) : super(const BrandsInitial());

  List<BrandEntity> allBrands = [];

  Future<void> getBrands() async {
    emit(const BrandsLoading());
    final result = await _getBrandsUseCase();
    result.fold(
      (failure) => emit(BrandsError(failure.errMsg)),
      (brands) {
        allBrands = brands;
        emit(BrandsLoaded(brands));
      },
    );
  }

  void searchBrands(String query) {
    if (query.isEmpty) {
      emit(BrandsLoaded(allBrands));
    } else {
      final filteredBrands = allBrands
          .where((brand) =>
              brand.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(BrandsLoaded(filteredBrands));
    }
  }
}
