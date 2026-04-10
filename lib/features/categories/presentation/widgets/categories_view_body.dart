import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'categories_search_text_field.dart';
import 'categories_grid.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          HeightSpace(height: 24),
          CustomBackButtonWithTitleHeader(title: "Categories"),
          HeightSpace(height: 24),
          CategoriesSearchTextField(),
          HeightSpace(height: 16),
          Expanded(
            child: CategoriesGrid(),
          ),
        ],
      ),
    );
  }
}
