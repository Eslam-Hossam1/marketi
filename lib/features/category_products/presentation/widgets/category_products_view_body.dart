import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import '../manager/category_products_cubit.dart';
import 'category_products_grid.dart';
import 'category_products_scrolling_loading_indicator_builder.dart';

class CategoryProductsViewBody extends StatefulWidget {
  final String title;
  const CategoryProductsViewBody({super.key, required this.title});

  @override
  State<CategoryProductsViewBody> createState() => _CategoryProductsViewBodyState();
}

class _CategoryProductsViewBodyState extends State<CategoryProductsViewBody> {
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
      context.read<CategoryProductsCubit>().fetchMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await context.read<CategoryProductsCubit>().refreshProducts();
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
              child: CustomBackButtonWithTitleHeader(title: widget.title),
            ),
            const SliverToBoxAdapter(child: HeightSpace(height: 24)),
            const CategoryProductsGrid(),
            const CategoryProductsScrollingLoadingIndicatorBuilder(),
          ],
        ),
      ),
    );
  }
}
