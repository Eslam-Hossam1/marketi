import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/product/product_card.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/brand_products_cubit.dart';
import '../manager/brand_products_state.dart';

class BrandProductsGrid extends StatelessWidget {
  const BrandProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandProductsCubit, BrandProductsState>(
      listener: (context, state) {
        if (state is BrandProductsLoadingMoreFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final brandProductsCubit = context.read<BrandProductsCubit>();
        final products = brandProductsCubit.products;

        if (state is BrandProductsFirstLoading) {
          return const SliverFillRemaining(
            child: Center(child: CustomCircularProgressIndecator()),
          );
        } else if (state is BrandProductsFirstFetchFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFailureMessageWithButton(
              failureMessage: state.errorMessage,
              onPressed: () => brandProductsCubit.refreshProducts(),
            ),
          );
        } else if (state is BrandProductsEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text("No products found.")),
          );
        } else {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w(context),
              mainAxisSpacing: 16.h(context),
              childAspectRatio: 0.62,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        }
      },
    );
  }
}
