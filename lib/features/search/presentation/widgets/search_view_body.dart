import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/custom_header_with_image.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'search_results_grid.dart';
import 'search_scrolling_loading_indicator_builder.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
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
      context.read<SearchCubit>().fetchMoreSearch();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: HeightSpace(height: 24)),
          const SliverToBoxAdapter(
            child: CustomHeaderWithImage(title: "Search"),
          ),
          const SliverToBoxAdapter(child: HeightSpace(height: 24)),
          const SliverToBoxAdapter(
            child: SearchTextField(),
          ),
          const SliverToBoxAdapter(child: HeightSpace(height: 16)),
          const SearchResultsGrid(),
          const SearchScrollingLoadingIndicatorBuilder(),
        ],
      ),
    );
  }
}
