import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/core/widgets/custom_failure_message_with_button.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';
import '../manager/product_details_cubit/product_details_state.dart';
import 'product_details_header.dart';
import 'carousel/product_details_carousel.dart';
import 'info/product_details_info.dart';
import 'product_details_bottom_bar.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading || state is ProductDetailsInitial) {
          return const Center(child: CustomCircularProgressIndecator());
        } else if (state is ProductDetailsFailure) {
          return CustomFailureMessageWithButton(
            failureMessage: state.errorMessage,
            btnText: 'Retry',
            onPressed: () {
              context.read<ProductDetailsCubit>().getProductDetails();
            },
          );
        } else if (state is ProductDetailsSuccess) {
          final product = state.productDetails;
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: ProductDetailsHeader()),
              const SliverToBoxAdapter(child: HeightSpace(height: 16)),
              SliverToBoxAdapter(
                child: ProductDetailsCarousel(images: product.images),
              ),
              const SliverToBoxAdapter(child: HeightSpace(height: 24)),
              SliverToBoxAdapter(child: ProductDetailsInfo(product: product)),
              const SliverToBoxAdapter(child: HeightSpace(height: 24)),

              SliverStickyFooter(
                horizontalPadding: 16,
                children: [ProductDetailsBottomBar(price: product.price, productId: product.id)],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
