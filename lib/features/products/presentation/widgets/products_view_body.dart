import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'products_grid.dart';

class ProductsViewBody extends StatelessWidget {
  final String title;
  const ProductsViewBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const HeightSpace(height: 24),
          CustomBackButtonWithTitleHeader(title: title),
          const HeightSpace(height: 24),
          const Expanded(
            child: ProductsGrid(),
          ),
        ],
      ),
    );
  }
}
