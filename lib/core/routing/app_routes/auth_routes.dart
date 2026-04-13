import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/auth/domain/usecases/login_use_case.dart';
import 'package:marketi/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/sign_up_view.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt<LoginUseCase>()),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpCubit(getIt<SignUpUseCase>()),
        child: const SignUpView(),
      ),
    ),
  ];
}
