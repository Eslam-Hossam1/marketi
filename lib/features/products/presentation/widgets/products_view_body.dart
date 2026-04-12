import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import '../manager/products_cubit/products_cubit.dart';
import 'products_grid.dart';
import 'products_scrolling_loading_indicator_builder.dart';

class ProductsViewBody extends StatefulWidget {
  final String title;
  const ProductsViewBody({super.key, required this.title});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
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
      context.read<ProductsCubit>().fetchMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await context.read<ProductsCubit>().refreshProducts();
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
            const ProductsGrid(),
            const ProductsScrollingLoadingIndicatorBuilder(),
          ],
        ),
      ),
    );
  }
}
