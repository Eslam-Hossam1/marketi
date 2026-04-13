// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marketi/core/entities/brand_entity.dart';
// import 'package:marketi/core/entities/category_entity.dart';
// import 'package:marketi/core/entities/product_entity.dart';
// import 'package:marketi/core/params/product_params.dart';
// import 'package:marketi/features/brands/domain/usecases/get_brands_use_case.dart';
// import 'package:marketi/features/categories/domain/usecases/get_categories_use_case.dart';
// import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
// import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final GetBrandsUseCase _getBrandsUseCase;
//   final GetCategoriesUseCase _getCategoriesUseCase;
//   final GetProductsUseCase _getProductsUseCase;

//   HomeCubit(
//     this._getBrandsUseCase,
//     this._getCategoriesUseCase,
//     this._getProductsUseCase,
//   ) : super(const HomeInitial());

//   List<BrandEntity> brands = [];
//   List<CategoryEntity> categories = [];
//   List<ProductEntity> popularProducts = [];
//   List<ProductEntity> bestForYouProducts = [];
//   List<ProductEntity> buyAgainProducts = [];

//   Future<void> getHomeData() async {
//     emit(const HomeLoading());

//     // Sequential for simplicity in this aggregate fake data load
//     final brandsResult = await _getBrandsUseCase();
//     final categoriesResult = await _getCategoriesUseCase();
//     final popularProductsResult =
//         await _getProductsUseCase(const ProductParams(popular: true));
//     final bestForYouResult =
//         await _getProductsUseCase(const ProductParams(rating: 4.5));
//     final buyAgainResult =
//         await _getProductsUseCase(const ProductParams(skip: 10));

//     brandsResult.fold(
//       (failure) =>
//           emit(HomeError(failure.serverErrorMessage ?? failure.errMsg)),
//       (data) => brands = data,
//     );

//     if (state is HomeError) return;

//     categoriesResult.fold(
//       (failure) =>
//           emit(HomeError(failure.serverErrorMessage ?? failure.errMsg)),
//       (data) => categories = data,
//     );

//     if (state is HomeError) return;

//     popularProductsResult.fold(
//       (failure) =>
//           emit(HomeError(failure.serverErrorMessage ?? failure.errMsg)),
//       (data) => popularProducts = data.list,
//     );

//     if (state is HomeError) return;

//     bestForYouResult.fold(
//       (failure) =>
//           emit(HomeError(failure.serverErrorMessage ?? failure.errMsg)),
//       (data) => bestForYouProducts = data.list,
//     );

//     if (state is HomeError) return;

//     buyAgainResult.fold(
//       (failure) =>
//           emit(HomeError(failure.serverErrorMessage ?? failure.errMsg)),
//       (data) => buyAgainProducts = data.list,
//     );

//     if (state is HomeError) return;

//     emit(const HomeLoaded());
//   }
// }
