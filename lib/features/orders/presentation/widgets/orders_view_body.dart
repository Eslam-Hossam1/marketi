import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_failure_message_with_button.dart';
import '../manager/orders_cubit/orders_cubit.dart';
import '../manager/orders_cubit/orders_state.dart';
import '../widgets/order_card.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is OrdersLoading ||
          current is OrdersSuccess ||
          current is OrdersFailure,
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OrdersFailure) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () => context.read<OrdersCubit>().fetchOrders(),
          );
        }

        if (state is OrdersSuccess) {
          if (state.orders.isEmpty) {
            return Center(
              child: Text(
                'No orders yet.',
                style: AppTextStyles.regular16(context)
                    .copyWith(color: context.secondaryTextColor),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<OrdersCubit>().fetchOrders(),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w(context),
                vertical: 16.h(context),
              ),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                return OrderCard(order: state.orders[index]);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
