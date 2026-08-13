import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/features/products/domain/usecases/get_products_use_case.dart';
import 'package:nextcart/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:nextcart/features/products/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  final String title;
  final ProductParams params;

  const ProductsView({
    super.key, 
    required this.title,
    this.params = const ProductParams(),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<GetProductsUseCase>())
        ..firstFetchProducts(params: params),
      child: Scaffold(
        body: SafeArea(
          child: ProductsViewBody(
            title: title,
            badgeColor: params.targetType == 'discount' ? const Color(0xFF7C3AED) : null,
          ),
        ),
      ),
    );
  }
}
