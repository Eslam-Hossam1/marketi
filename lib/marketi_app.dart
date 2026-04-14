import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/app_router.dart';
import 'package:marketi/core/theme/app_themes.dart';
import 'package:marketi/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => CartCubit(
            getIt<GetCartUseCase>(),
            getIt<AddToCartUseCase>(),
            getIt<RemoveFromCartUseCase>(),
          )..getCart(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.light,
          );
        },
      ),
    );
  }
}
