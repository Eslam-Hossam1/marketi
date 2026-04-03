import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/widgets/custom_screen_placeholder.dart';
import 'package:marketi/features/auth/presentation/views/sign_up_view.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) =>
          const CustomScreenPlaceholder(text: "Login View"),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => const SignUpView(),
    ),
  ];
}
