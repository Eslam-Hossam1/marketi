import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:marketi/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/core/routing/app_routes/auth_routes.dart';
import 'package:marketi/core/routing/app_routes/brand_products_routes.dart';
import 'package:marketi/core/routing/app_routes/category_products_routes.dart';
import 'package:marketi/core/routing/app_routes/main_route.dart';
import 'package:marketi/core/routing/app_routes/onboarding_route.dart';
import 'package:marketi/core/routing/app_routes/otp_route.dart';
import 'package:marketi/core/routing/app_routes/product_routes.dart';
import 'package:marketi/core/routing/app_routes/profile_route.dart';
import 'package:marketi/features/profile/domain/usecases/get_user_data_use_case.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:marketi/core/routing/app_routes/payment_routes.dart';
import 'package:marketi/core/routing/app_routes/reset_password_routes.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    // Authenticated Shell: home / cart / favorites / profile + full screen features
    ShellRoute(
      builder: (context, state, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CartCubit(
                getIt<GetCartUseCase>(),
                getIt<AddToCartUseCase>(),
                getIt<RemoveFromCartUseCase>(),
              )..getCart(),
            ),
            BlocProvider(
              create: (context) =>
                  ProfileCubit(getIt<GetUserDataUseCase>()),
            ),
          ],
          child: child,
        );
      },
      routes: [
        ...MainRoute.routes,
        ...ProfileRoute.routes,
        ...ProductRoutes.routes,
        ...CategoryProductsRoutes.routes,
        ...BrandProductsRoutes.routes,
      ],
    ),

    // Standalone flows (no bottom nav)
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...ResetPasswordRoutes.routes,
    ...OtpRoute.routes,
    ...PaymentRoutes.routes,
  ];
}
