import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/categories/domain/usecases/get_categories_use_case.dart';
import '../manager/categories_cubit/categories_cubit.dart';
import '../widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(getIt<GetCategoriesUseCase>())..getCategories(),
      child: const Scaffold(
        body: SafeArea(
          child: CategoriesViewBody(),
        ),
      ),
    );
  }
}
