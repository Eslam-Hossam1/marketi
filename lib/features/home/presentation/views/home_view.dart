import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/brands/domain/usecases/get_brands_use_case.dart';
import 'package:marketi/features/categories/domain/usecases/get_categories_use_case.dart';
import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
import 'package:marketi/features/home/presentation/manager/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:marketi/features/home/presentation/manager/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BrandsCubit(getIt<GetBrandsUseCase>())..getBrands()),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(getIt<GetCategoriesUseCase>())..getCategories(),
        ),
        BlocProvider(
          create: (context) => PopularProductsCubit(getIt<GetProductsUseCase>())
            ..getPopularProducts(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}

