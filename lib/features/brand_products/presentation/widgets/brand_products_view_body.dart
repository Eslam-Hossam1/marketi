import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/custom_header_with_image.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import '../manager/brand_products_cubit.dart';
import 'brand_products_grid.dart';
import 'brand_products_scrolling_loading_indicator_builder.dart';

class BrandProductsViewBody extends StatefulWidget {
  final String title;
  const BrandProductsViewBody({super.key, required this.title});

  @override
  State<BrandProductsViewBody> createState() => _BrandProductsViewBodyState();
}

class _BrandProductsViewBodyState extends State<BrandProductsViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * Constants.loadMoreTriggerRatio) {
      context.read<BrandProductsCubit>().fetchMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await context.read<BrandProductsCubit>().refreshProducts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverToBoxAdapter(child: HeightSpace(height: 24)),
            SliverToBoxAdapter(
              child: CustomHeaderWithImage(title: widget.title),
            ),
            const SliverToBoxAdapter(child: HeightSpace(height: 24)),
            const BrandProductsGrid(),
            const BrandProductsScrollingLoadingIndicatorBuilder(),
          ],
        ),
      ),
    );
  }
}
