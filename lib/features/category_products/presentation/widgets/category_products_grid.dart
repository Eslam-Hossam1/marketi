import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/product/product_card.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/category_products_cubit.dart';
import '../manager/category_products_state.dart';

class CategoryProductsGrid extends StatelessWidget {
  const CategoryProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
      listener: (context, state) {
        if (state is CategoryProductsLoadingMoreFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final categoryProductsCubit = context.read<CategoryProductsCubit>();
        final products = categoryProductsCubit.products;

        if (state is CategoryProductsFirstLoading) {
          return const SliverFillRemaining(
            child: Center(child: CustomCircularProgressIndecator()),
          );
        } else if (state is CategoryProductsFirstFetchFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFailureMessageWithButton(
              failureMessage: state.errorMessage,
              onPressed: () => categoryProductsCubit.refreshProducts(),
            ),
          );
        } else if (state is CategoryProductsEmpty) {
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
