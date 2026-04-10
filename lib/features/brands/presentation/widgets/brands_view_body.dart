import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'brands_search_text_field.dart';
import 'brands_list.dart';

class BrandsViewBody extends StatelessWidget {
  const BrandsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          HeightSpace(height: 24),
          CustomBackButtonWithTitleHeader(title: "Brands"),
          HeightSpace(height: 24),
          BrandsSearchTextField(),
          HeightSpace(height: 16),
          Expanded(
            child: BrandsList(),
          ),
        ],
      ),
    );
  }
}
