import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_header_with_image.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'brands_search_text_field.dart';
import 'brands_list.dart';

class BrandsViewBody extends StatelessWidget {
  const BrandsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeightSpace(height: 24)),
          SliverToBoxAdapter(
            child: CustomHeaderWithImage(title: "Brands"),
          ),
          SliverToBoxAdapter(child: HeightSpace(height: 24)),
          SliverToBoxAdapter(
            child: BrandsSearchTextField(),
          ),
          SliverToBoxAdapter(child: HeightSpace(height: 16)),
          BrandsList(),
          SliverToBoxAdapter(child: HeightSpace(height: 16)),
        ],
      ),
    );
  }
}
