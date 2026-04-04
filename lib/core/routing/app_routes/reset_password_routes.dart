import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/forgot_password/presentation/views/forgot_password_view.dart';
import 'package:marketi/features/forgot_password/presentation/views/reset_password_view.dart';

class ResetPasswordRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.forgotPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ForgotPasswordCubit>(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: RoutePaths.resetPassword,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>()..formData.email = email,
          child: const ResetPasswordView(),
        );
      },
    ),
  ];
}
