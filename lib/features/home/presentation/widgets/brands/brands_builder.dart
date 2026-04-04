import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/presentation/manager/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/manager/brands_cubit/brands_state.dart';
import 'package:marketi/features/home/presentation/widgets/brands/home_brands_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';

class BrandsBuilder extends StatelessWidget {
  const BrandsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoaded) {
          return HomeBrandsList(brands: context.read<BrandsCubit>().brands!);
        } else if (state is BrandsError) {
          return CustomFailureMessageWithButton(
            message: state.message,
            onPressed: () {
              context.read<BrandsCubit>().getBrands();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: HomeBrandsList(
              brands: List.generate(
                10,
                (index) => const BrandEntity(name: "Brand Name", emoji: "✨"),
              ),
            ),
          );
        }
      },
    );
  }
}
