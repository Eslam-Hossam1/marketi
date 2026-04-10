import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/products/domain/usecases/get_products_use_case.dart';
import '../manager/products_cubit/products_cubit.dart';
import '../widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  final String title;
  final String? categoryId;
  final String? brandId;

  const ProductsView({
    super.key,
    required this.title,
    this.categoryId,
    this.brandId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<GetProductsUseCase>())
        ..getProducts(
          categoryId: categoryId,
          brandId: brandId,
        ),
      child: Scaffold(
        body: SafeArea(
          child: ProductsViewBody(title: title),
        ),
      ),
    );
  }
}
