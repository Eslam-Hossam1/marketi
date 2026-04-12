import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/product/product_card.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/products_cubit/products_cubit.dart';
import '../manager/products_cubit/products_state.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsLoadingMoreFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final productsCubit = context.read<ProductsCubit>();
        final products = productsCubit.products;

        if (state is ProductsFirstLoading) {
          return const SliverFillRemaining(
            child: Center(child: CustomCircularProgressIndecator()),
          );
        } else if (state is ProductsFirstFetchFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFailureMessageWithButton(
              failureMessage: state.errorMessage,
              onPressed: () => productsCubit.refreshProducts(),
            ),
          );
        } else if (state is ProductsEmpty) {
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
              childAspectRatio: 0.7,
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
