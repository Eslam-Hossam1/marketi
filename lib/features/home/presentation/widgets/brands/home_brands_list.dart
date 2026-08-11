import 'package:flutter/material.dart';
import 'package:nextcart/core/entities/brand_entity.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/features/home/presentation/widgets/common/home_section_header.dart';
import 'package:nextcart/features/home/presentation/widgets/brands/brand_item.dart';

class HomeBrandsList extends StatelessWidget {
  final List<BrandEntity> brands;
  const HomeBrandsList({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          title: "Brands",
          onViewAllPressed: () => RoutingHelper.pushBrands(context),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BrandItem(brand: brands[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: brands.length,
          ),
        ),
      ],
    );
  }
}
