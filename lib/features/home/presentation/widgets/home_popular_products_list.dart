import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/home/presentation/widgets/home_section_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_product_card.dart';

class HomePopularProductsList extends StatelessWidget {
  const HomePopularProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionHeader(title: "Popular Product"),
        const SizedBox(height: 16),
        SizedBox(
          height: 230.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const HomeProductCard(
                name: "Smart Watch",
                imageUrl:
                    "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3", // placeholder
                price: 499,
                rating: 4.9,
                discount: "15% OFF",
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
