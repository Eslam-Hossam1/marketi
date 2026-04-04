import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/home/presentation/manager/best_for_you_products_cubit/best_for_you_products_cubit.dart';
import 'package:marketi/features/home/presentation/manager/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/manager/buy_again_products_cubit/buy_again_products_cubit.dart';
import 'package:marketi/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:marketi/features/home/presentation/manager/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BrandsCubit>()..getBrands()),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<PopularProductsCubit>()..getPopularProducts(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<BestForYouProductsCubit>()..getBestForYouProducts(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<BuyAgainProductsCubit>()..getBuyAgainProducts(),
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
