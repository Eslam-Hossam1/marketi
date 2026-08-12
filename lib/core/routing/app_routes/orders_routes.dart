import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/orders/domain/params/order_details_params.dart';
import 'package:nextcart/features/orders/domain/usecases/get_order_details_use_case.dart';
import 'package:nextcart/features/orders/domain/usecases/get_orders_use_case.dart';
import 'package:nextcart/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:nextcart/features/orders/presentation/views/order_details_view.dart';
import 'package:nextcart/features/orders/presentation/views/orders_view.dart';

class OrdersRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.orders,
      builder: (context, state) => BlocProvider(
        create: (context) => OrdersCubit(
          getIt<GetOrdersUseCase>(),
          getIt<GetOrderDetailsUseCase>(),
        )..fetchOrders(),
        child: const OrdersView(),
      ),
    ),
    GoRoute(
      path: RoutePaths.orderDetails,
      builder: (context, state) {
        final params = state.extra as OrderDetailsParams;
        return BlocProvider(
          create: (context) => OrdersCubit(
            getIt<GetOrdersUseCase>(),
            getIt<GetOrderDetailsUseCase>(),
          )..fetchOrderDetails(params.orderId),
          child: OrderDetailsView(params: params),
        );
      },
    ),
  ];
}
