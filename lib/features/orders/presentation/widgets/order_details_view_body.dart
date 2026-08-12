import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/widgets/buttons/custom_button.dart';
import 'package:nextcart/features/orders/domain/params/order_details_params.dart';
import 'package:nextcart/core/widgets/custom_failure_message_with_button.dart';
import '../manager/orders_cubit/orders_cubit.dart';
import '../manager/orders_cubit/orders_state.dart';
import 'order_details_header.dart';
import 'order_items_list.dart';
import 'payment_summary_card.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.params});

  final OrderDetailsParams params;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is OrderDetailsLoading ||
          current is OrderDetailsSuccess ||
          current is OrderDetailsFailure,
      builder: (context, state) {
        if (state is OrderDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OrderDetailsFailure) {
          return CustomFailureMessageWithButton(
            failureMessage: state.message,
            onPressed: () =>
                context.read<OrdersCubit>().fetchOrderDetails(params.orderId),
          );
        }

        if (state is OrderDetailsSuccess) {
          final order = state.orderDetails.order;
          final items = state.orderDetails.items;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.r(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsHeader(order: order),
                      SizedBox(height: 24.h(context)),
                      OrderItemsList(items: items),
                      SizedBox(height: 24.h(context)),
                      PaymentSummaryCard(order: order),
                    ],
                  ),
                ),
              ),
              if (params.fromCheckout)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    16.w(context),
                    8.h(context),
                    16.w(context),
                    16.h(context),
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    onPressed: () => context.go(RoutePaths.home),
                    borderRadius: 16.r(context),
                    child: Text(
                      'Continue Shopping',
                      style: AppTextStyles.bold16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
