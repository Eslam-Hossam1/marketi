import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/product/product_card.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/search_cubit/search_cubit.dart';
import '../manager/search_cubit/search_state.dart';

class SearchResultsGrid extends StatefulWidget {
  const SearchResultsGrid({super.key});

  @override
  State<SearchResultsGrid> createState() => _SearchResultsGridState();
}

class _SearchResultsGridState extends State<SearchResultsGrid> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      context.read<SearchCubit>().searchProducts(
            context.read<SearchCubit>().currentSearchQuery,
            isLoadMore: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text("Search for products..."));
        } else if (state is SearchLoading) {
          return const Center(child: CustomCircularProgressIndecator());
        } else if (state is SearchError) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () => context.read<SearchCubit>().searchProducts(
                  context.read<SearchCubit>().currentSearchQuery,
                ),
          );
        } else if (state is SearchLoaded ||
            state is SearchPaginationLoading ||
            state is SearchPaginationError) {
          final products = (state is SearchLoaded)
              ? state.products
              : (state is SearchPaginationLoading)
                  ? state.products
                  : (state is SearchPaginationError)
                      ? state.products
                      : [];

          if (products.isEmpty) {
            return const Center(child: Text("No products found."));
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w(context),
                      mainAxisSpacing: 16.h(context),
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ),
              ),
              if (state is SearchPaginationLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomCircularProgressIndecator(),
                ),
              if (state is SearchPaginationError)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(state.message),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
