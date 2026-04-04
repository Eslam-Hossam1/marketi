import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/manager/best_for_you_products_cubit/best_for_you_products_cubit.dart';
import 'package:marketi/features/home/presentation/manager/best_for_you_products_cubit/best_for_you_products_state.dart';
import 'package:marketi/features/home/presentation/widgets/best_for_you_products/home_best_for_you_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';

class BestForYouProductsBuilder extends StatelessWidget {
  const BestForYouProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestForYouProductsCubit, BestForYouProductsState>(
      builder: (context, state) {
        if (state is BestForYouProductsLoaded) {
          return HomeBestForYouList(
            products: context.read<BestForYouProductsCubit>().products!,
          );
        } else if (state is BestForYouProductsError) {
          return CustomFailureMessageWithButton(
            message: state.message,
            onPressed: () {
              context.read<BestForYouProductsCubit>().getBestForYouProducts();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: HomeBestForYouList(
              products: List.generate(
                5,
                (index) => const ProductEntity(
                  id: 1,
                  title: "Product Title",
                  description: "Description",
                  category: "Category",
                  price: 99.9,
                  discountPercentage: 10,
                  rating: 4.5,
                  stock: 10,
                  brand: "Brand",
                  thumbnail: "thumbnail",
                  images: [],
                  tags: [],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
