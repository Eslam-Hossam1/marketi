import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/manager/buy_again_products_cubit/buy_again_products_cubit.dart';
import 'package:marketi/features/home/presentation/manager/buy_again_products_cubit/buy_again_products_state.dart';
import 'package:marketi/features/home/presentation/widgets/buy_again_products/home_buy_again_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';

class BuyAgainProductsBuilder extends StatelessWidget {
  const BuyAgainProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyAgainProductsCubit, BuyAgainProductsState>(
      builder: (context, state) {
        if (state is BuyAgainProductsLoaded) {
          return HomeBuyAgainList(
            products: context.read<BuyAgainProductsCubit>().products!,
          );
        } else if (state is BuyAgainProductsError) {
          return CustomFailureMessageWithButton(
            message: state.message,
            onPressed: () {
              context.read<BuyAgainProductsCubit>().getBuyAgainProducts();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: HomeBuyAgainList(
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
