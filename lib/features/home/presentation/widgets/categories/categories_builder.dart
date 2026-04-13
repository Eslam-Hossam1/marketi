import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/entities/category_entity.dart';
import 'package:marketi/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:marketi/features/home/presentation/manager/categories_cubit/categories_state.dart';
import 'package:marketi/features/home/presentation/widgets/categories/home_categories_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return HomeCategoriesGrid(
            categories: context.read<CategoriesCubit>().categories!,
          );
        } else if (state is CategoriesError) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () {
              context.read<CategoriesCubit>().getCategories();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: HomeCategoriesGrid(
              categories: List.generate(
                10,
                (index) => const CategoryEntity(
                  slug: "slug",
                  name: "Category Name",
                  url: "url",
                  image: "image",
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
