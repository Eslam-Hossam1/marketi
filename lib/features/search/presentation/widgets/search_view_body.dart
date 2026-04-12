import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';
import 'package:go_router/go_router.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'search_results_grid.dart';
import 'search_scrolling_loading_indicator_builder.dart';

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
    return Column(
      children: [
        const HeightSpace(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.w(context),
                  color: context.primaryColor,
                ),
              ),
              const WidthSpace(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: "What are you looking for ?",
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.primaryColor,
                    size: 20.w(context),
                  ),
                  autoFocus: true,
                  onChanged: (value) {
                    context.read<SearchCubit>().firstFetchSearch(value!);
                  },
                ),
              ),
            ],
          ),
        ),
        const HeightSpace(height: 24),
        Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: const [
              SearchResultsGrid(),
              SearchScrollingLoadingIndicatorBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}
