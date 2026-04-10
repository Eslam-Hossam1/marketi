import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/brands_cubit/brands_cubit.dart';
import '../manager/brands_cubit/brands_state.dart';
import 'brand_item.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoading) {
          return const Center(child: CustomCircularProgressIndecator());
        } else if (state is BrandsError) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () => context.read<BrandsCubit>().getBrands(),
          );
        } else if (state is BrandsLoaded) {
          if (state.brands.isEmpty) {
            return const Center(child: Text("No brands found."));
          }
          return ListView.builder(
            itemCount: state.brands.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) {
              return BrandItem(brand: state.brands[index]);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
