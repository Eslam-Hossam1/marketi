import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/product/product_card.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/products_cubit/products_cubit.dart';
import '../manager/products_cubit/products_state.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
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
      context.read<ProductsCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CustomCircularProgressIndecator());
        } else if (state is ProductsError) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () => context.read<ProductsCubit>().getProducts(),
          );
        } else if (state is ProductsLoaded ||
            state is ProductsPaginationLoading ||
            state is ProductsPaginationError) {
          final products = (state is ProductsLoaded)
              ? state.products
              : (state is ProductsPaginationLoading)
                  ? state.products
                  : (state is ProductsPaginationError)
                      ? state.products
                      : [];

          final bool hasReachedMax =
              (state is ProductsLoaded) ? state.hasReachedMax : false;

          return Column(
            children: [
              Expanded(
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
              if (state is ProductsPaginationLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomCircularProgressIndecator(),
                ),
              if (state is ProductsPaginationError)
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
