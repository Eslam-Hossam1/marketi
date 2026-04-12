import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import '../manager/category_products_cubit.dart';
import '../manager/category_products_state.dart';

class CategoryProductsScrollingLoadingIndicatorBuilder extends StatelessWidget {
  const CategoryProductsScrollingLoadingIndicatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        if (state is CategoryProductsLoadingMore) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CustomCircularProgressIndecator(),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
