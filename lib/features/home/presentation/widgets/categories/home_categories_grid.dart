import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/entities/category_entity.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/home/presentation/widgets/common/home_section_header.dart';
import 'package:marketi/features/home/presentation/widgets/categories/category_item.dart';

class HomeCategoriesGrid extends StatelessWidget {
  final List<CategoryEntity> categories;
  const HomeCategoriesGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          title: "Category",
          onViewAllPressed: () => context.push(RoutePaths.categories),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                category: categories[index],
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
