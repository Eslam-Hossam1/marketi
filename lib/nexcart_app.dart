import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexcart/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:nexcart/core/routing/app_router.dart';
import 'package:nexcart/core/theme/app_themes.dart';

class NexcartApp extends StatelessWidget {
  const NexcartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
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
