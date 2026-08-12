import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/services/stripe_service/stripe_service.dart';
import 'package:nextcart/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:nextcart/features/cart/domain/usecases/update_cart_quantity_use_case.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:nextcart/features/checkout/domain/usecases/create_checkout_use_case.dart';
import 'package:nextcart/features/checkout/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:nextcart/features/favorites/domain/usecases/add_to_favorites_use_case.dart';
import 'package:nextcart/features/favorites/domain/usecases/get_favorites_use_case.dart';
import 'package:nextcart/features/favorites/domain/usecases/remove_from_favorites_use_case.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/core/routing/app_routes/auth_routes.dart';
import 'package:nextcart/core/routing/app_routes/brand_products_routes.dart';
import 'package:nextcart/core/routing/app_routes/category_products_routes.dart';
import 'package:nextcart/core/routing/app_routes/main_route.dart';
import 'package:nextcart/core/routing/app_routes/onboarding_route.dart';
import 'package:nextcart/core/routing/app_routes/otp_route.dart';
import 'package:nextcart/core/routing/app_routes/product_routes.dart';
import 'package:nextcart/core/routing/app_routes/profile_route.dart';
import 'package:nextcart/core/routing/app_routes/reset_password_routes.dart';
import 'package:nextcart/core/routing/app_routes/checkout_routes.dart';
import 'package:nextcart/core/routing/app_routes/orders_routes.dart';
import 'package:nextcart/features/auth/domain/usecases/logout_use_case.dart';
import 'package:nextcart/features/profile/domain/usecases/get_user_data_use_case.dart';
import 'package:nextcart/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                getIt<UpdateCartQuantityUseCase>(),
              )..getCart(),
            ),
            BlocProvider(
              create: (context) => FavoritesCubit(
                getIt<GetFavoritesUseCase>(),
                getIt<AddToFavoritesUseCase>(),
                getIt<RemoveFromFavoritesUseCase>(),
              )..getFavorites(),
            ),
            BlocProvider(
              create: (context) => CheckoutCubit(
                createCheckoutUseCase: getIt<CreateCheckoutUseCase>(),
                stripeService: getIt<StripeService>(),
                supabaseClient: getIt<SupabaseClient>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(
                getIt<GetUserDataUseCase>(),
                getIt<LogoutUseCase>(),
              )..getUserData(),
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
        ...OrdersRoutes.routes,
        ...CheckoutRoutes.routes,
      ],
    ),

    // Standalone flows (no bottom nav)
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...ResetPasswordRoutes.routes,
    ...OtpRoute.routes,
  ];
}
