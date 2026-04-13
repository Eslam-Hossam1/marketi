import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/categories_cubit/categories_cubit.dart';
import '../manager/categories_cubit/categories_state.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const SliverFillRemaining(
            child: Center(child: CustomCircularProgressIndecator()),
          );
        } else if (state is CategoriesError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFailureMessageWithButton(
              failureMessage: state.message,
              onPressed: () => context.read<CategoriesCubit>().getCategories(),
            ),
          );
        } else if (state is CategoriesLoaded) {
          if (state.categories.isEmpty) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text("No categories found.")),
            );
          }
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(category: state.categories[index]);
            },
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
