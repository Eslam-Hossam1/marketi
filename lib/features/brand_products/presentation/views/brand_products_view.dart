import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/brand_products/domain/usecases/get_brand_products_use_case.dart';
import '../manager/brand_products_cubit.dart';
import '../widgets/brand_products_view_body.dart';

class BrandProductsView extends StatelessWidget {
  final String title;
  final String brand;

  const BrandProductsView({
    super.key,
    required this.title,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandProductsCubit(getIt<GetBrandProductsUseCase>())
        ..firstFetchProducts(brand),
      child: Scaffold(
        body: SafeArea(
          child: BrandProductsViewBody(title: title),
        ),
      ),
    );
  }
}
