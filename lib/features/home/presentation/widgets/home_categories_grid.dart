import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/home/presentation/widgets/home_section_header.dart';
import 'package:marketi/features/home/presentation/widgets/category_item.dart';

class HomeCategoriesGrid extends StatelessWidget {
  const HomeCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Pampers",
      "Electronics",
      "Plants",
      "Phones",
      "Food",
      "Fashion"
    ];

    return Column(
      children: [
        const HomeSectionHeader(title: "Category"),
        const SizedBox(height: 16),
        SizedBox(
          height: 120.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                name: categories[index],
                imageUrl: "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3", // placeholder
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 24),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
