import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/entities/product_entity.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/features/home/presentation/widgets/common/home_section_header.dart';
import 'package:marketi/core/widgets/product/product_card.dart';

class HomePopularProductsList extends StatelessWidget {
  final List<ProductEntity> products;
  const HomePopularProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          title: "Popular Products",
          onViewAllPressed: () {
            RoutingHelper.pushProducts(context, title: "Popular Products");
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 230.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ProductCard(product: products[index]),
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
