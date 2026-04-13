import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/category_entity.dart';
import 'package:marketi/features/categories/domain/usecases/get_categories_use_case.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesCubit(this._getCategoriesUseCase) : super(const CategoriesInitial());

  List<CategoryEntity> allCategories = [];

  Future<void> getCategories() async {
    emit(const CategoriesLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) => emit(CategoriesError(failure.errMsg)),
      (categories) {
        allCategories = categories;
        emit(CategoriesLoaded(categories));
      },
    );
  }

  void searchCategories(String query) {
    if (query.isEmpty) {
      emit(CategoriesLoaded(allCategories));
    } else {
      final filteredCategories = allCategories
          .where((category) =>
              category.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(CategoriesLoaded(filteredCategories));
    }
  }
}
