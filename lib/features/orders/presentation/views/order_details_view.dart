import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/orders/domain/params/order_details_params.dart';
import '../manager/orders_cubit/orders_cubit.dart';
import '../widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.params});

  final OrderDetailsParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<OrdersCubit>()..fetchOrderDetails(params.orderId),
      child: PopScope(
        canPop: !params.fromCheckout,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) {
            context.go(RoutePaths.home);
          }
        },
        child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.scaffoldBackgroundColor,
            elevation: 0,
            title: Text(
              'Order Details',
              style: AppTextStyles.bold18(context)
                  .copyWith(color: context.mainTextColor),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: context.mainTextColor),
            leading: params.fromCheckout
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => context.go(RoutePaths.home),
                  )
                : null,
          ),
          body: SafeArea(
            child: OrderDetailsViewBody(params: params),
          ),
        ),
      ),
    );
  }
}
