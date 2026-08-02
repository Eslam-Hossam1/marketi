import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

import '../manager/orders_cubit/orders_cubit.dart';
import '../manager/orders_cubit/orders_state.dart';
import '../widgets/order_items_list.dart';
import '../widgets/order_status_badge.dart';
import '../widgets/payment_summary_card.dart';
import 'package:intl/intl.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderId});
  
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..fetchOrderDetails(orderId),
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            'Order Details',
            style: AppTextStyles.bold18(context).copyWith(color: context.mainTextColor),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: context.mainTextColor),
        ),
        body: SafeArea(
          child: BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) => 
              current is OrderDetailsLoading || 
              current is OrderDetailsSuccess || 
              current is OrderDetailsFailure,
            builder: (context, state) {
              if (state is OrderDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OrderDetailsFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.regular16(context).copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (state is OrderDetailsSuccess) {
                final order = state.orderDetails.order;
                final items = state.orderDetails.items;
                final dateFormat = DateFormat('MMM dd, yyyy - hh:mm a');
                
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16.r(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order #${order.id.substring(0, 8).toUpperCase()}',
                            style: AppTextStyles.bold18(context).copyWith(color: context.mainTextColor),
                          ),
                          OrderStatusBadge(status: order.status),
                        ],
                      ),
                      SizedBox(height: 8.h(context)),
                      Text(
                        dateFormat.format(order.createdAt),
                        style: AppTextStyles.regular14(context).copyWith(color: context.secondaryTextColor),
                      ),
                      SizedBox(height: 24.h(context)),
                      
                      // Items list
                      OrderItemsList(items: items),
                      SizedBox(height: 24.h(context)),
                      
                      // Payment Summary
                      PaymentSummaryCard(order: order),
                    ],
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
