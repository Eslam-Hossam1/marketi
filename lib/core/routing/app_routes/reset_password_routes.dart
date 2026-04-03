import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/widgets/custom_screen_placeholder.dart';

class ResetPasswordRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.forgotPassword,
      builder: (context, state) =>
          const CustomScreenPlaceholder(text: "Forgot Password View"),
    ),
  ];
}
