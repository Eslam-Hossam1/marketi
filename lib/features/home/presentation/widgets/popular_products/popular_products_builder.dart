import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/manager/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/manager/popular_products_cubit/popular_products_state.dart';
import 'package:marketi/features/home/presentation/widgets/popular_products/home_popular_products_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';

class PopularProductsBuilder extends StatelessWidget {
  const PopularProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularProductsCubit, PopularProductsState>(
      builder: (context, state) {
        if (state is PopularProductsLoaded) {
          return HomePopularProductsList(
            products: context.read<PopularProductsCubit>().products!,
          );
        } else if (state is PopularProductsError) {
          return CustomFailureMessageWithButton(
            message: state.message,
            onPressed: () {
              context.read<PopularProductsCubit>().getPopularProducts();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: HomePopularProductsList(
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
