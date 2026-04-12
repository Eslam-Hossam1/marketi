import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/category_products/domain/usecases/get_category_products_use_case.dart';
import '../manager/category_products_cubit.dart';
import '../widgets/category_products_view_body.dart';

class CategoryProductsView extends StatelessWidget {
  final String title;
  final String categorySlug;

  const CategoryProductsView({
    super.key,
    required this.title,
    required this.categorySlug,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit(getIt<GetCategoryProductsUseCase>())
        ..firstFetchProducts(categorySlug),
      child: Scaffold(
        body: SafeArea(
          child: CategoryProductsViewBody(title: title),
        ),
      ),
    );
  }
}
