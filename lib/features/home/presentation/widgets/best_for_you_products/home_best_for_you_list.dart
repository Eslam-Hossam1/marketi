import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/common/home_section_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_product_card/home_product_card.dart';

class HomeBestForYouList extends StatelessWidget {
  final List<ProductEntity> products;
  const HomeBestForYouList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionHeader(title: "Best for You"),
        const SizedBox(height: 16),
        SizedBox(
          height: 260.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HomeProductCard(
                product: products[index],
                hasAddButton: true,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
