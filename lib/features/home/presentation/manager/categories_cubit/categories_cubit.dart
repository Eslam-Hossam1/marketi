import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/get_categories_use_case.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesCubit(this._getCategoriesUseCase) : super(const CategoriesInitial());

  List<CategoryEntity>? categories;

  Future<void> getCategories() async {
    emit(const CategoriesLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) =>
          emit(CategoriesError(failure.serverErrorMessage ?? failure.errMsg)),
      (categoriesList) {
        categories = categoriesList;
        emit(const CategoriesLoaded());
      },
    );
  }
}
