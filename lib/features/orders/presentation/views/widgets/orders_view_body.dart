import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:marketi/features/orders/presentation/manager/orders_cubit/orders_state.dart';
import 'order_card.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w(context)),
          child: Text(
            'Order History',
            style: AppTextStyles.bold24(context),
          ),
        ),
        Expanded(
          child: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const Center(child: CustomCircularProgressIndecator());
              } else if (state is OrdersFailure) {
                return Center(child: Text(state.message));
              } else if (state is OrdersSuccess) {
                if (state.orders.isEmpty) {
                  return const Center(child: Text('No orders yet.'));
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: state.orders[index]);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
