import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/sign_up_view.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => const SignUpView(),
    ),
  ];
}
