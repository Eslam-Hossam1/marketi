import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import '../../domain/usecases/get_product_details_usecase.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';
import '../widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final int productId;

  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(productId, getIt<GetProductDetailsUseCase>())
        ..getProductDetails(),
      child: Scaffold(
        body: SafeArea(
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
