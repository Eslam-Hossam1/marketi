import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import '../manager/brand_products_cubit.dart';
import '../manager/brand_products_state.dart';

class BrandProductsScrollingLoadingIndicatorBuilder extends StatelessWidget {
  const BrandProductsScrollingLoadingIndicatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandProductsCubit, BrandProductsState>(
      builder: (context, state) {
        if (state is BrandProductsLoadingMore) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CustomCircularProgressIndecator(),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
