import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import '../manager/orders_cubit/orders_cubit.dart';
import '../manager/orders_cubit/orders_state.dart';
import '../widgets/order_card.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..fetchOrders(),
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            'My Orders',
            style: AppTextStyles.bold18(context).copyWith(color: context.mainTextColor),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => 
              current is OrdersLoading || 
              current is OrdersSuccess || 
              current is OrdersFailure,
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OrdersFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.regular16(context).copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (state is OrdersSuccess) {
                if (state.orders.isEmpty) {
                  return Center(
                    child: Text(
                      'No orders yet.',
                      style: AppTextStyles.regular16(context).copyWith(color: context.secondaryTextColor),
                    ),
                  );
                }
                
                return RefreshIndicator(
                  onRefresh: () => context.read<OrdersCubit>().fetchOrders(),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w(context), vertical: 16.h(context)),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return OrderCard(order: state.orders[index]);
                    },
                  ),
                );
              }
              
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
