import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/home/presentation/widgets/best_for_you_products/best_for_you_products_builder.dart';
import 'package:marketi/features/home/presentation/widgets/brands/brands_builder.dart';
import 'package:marketi/features/home/presentation/widgets/buy_again_products/buy_again_products_builder.dart';
import 'package:marketi/features/home/presentation/widgets/categories/categories_builder.dart';
import 'package:marketi/features/home/presentation/widgets/header/home_header.dart';
import 'package:marketi/features/home/presentation/widgets/header/home_search_text_field.dart';
import 'package:marketi/features/home/presentation/widgets/promo_banner/home_promo_banner.dart';
import 'package:marketi/features/home/presentation/widgets/popular_products/popular_products_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeHeader()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeSearchTextField()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomePromoBanner()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: PopularProductsBuilder()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: CategoriesBuilder()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: BestForYouProductsBuilder()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: BrandsBuilder()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: BuyAgainProductsBuilder()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
      ],
    );
  }
}
