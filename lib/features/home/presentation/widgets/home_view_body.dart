import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/home/presentation/widgets/home_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_text_field.dart';
import 'package:marketi/features/home/presentation/widgets/home_promo_banner.dart';
import 'package:marketi/features/home/presentation/widgets/home_popular_products_list.dart';
import 'package:marketi/features/home/presentation/widgets/home_categories_grid.dart';
import 'package:marketi/features/home/presentation/widgets/home_best_for_you_list.dart';
import 'package:marketi/features/home/presentation/widgets/home_brands_list.dart';
import 'package:marketi/features/home/presentation/widgets/home_buy_again_list.dart';

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
        SliverToBoxAdapter(child: HomePopularProductsList()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeCategoriesGrid()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeBestForYouList()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeBrandsList()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
        SliverToBoxAdapter(child: HomeBuyAgainList()),
        SliverToBoxAdapter(child: HeightSpace(height: 24)),
      ],
    );
  }
}
