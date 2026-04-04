import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/features/home/presentation/widgets/home_section_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_product_card.dart';

class HomeBuyAgainList extends StatelessWidget {
  const HomeBuyAgainList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionHeader(title: "Buy Again"),
        const SizedBox(height: 16),
        SizedBox(
          height: 260.h(context),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const HomeProductCard(
                name: "Black Sony Headphone",
                imageUrl: "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3", // placeholder
                price: 399,
                rating: 4.5,
                hasAddButton: true,
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
