import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import '../manager/orders_cubit/orders_cubit.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: const Scaffold(
        body: SafeArea(
          child: OrdersViewBody(),
        ),
      ),
    );
  }
}
