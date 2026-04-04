import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/main/presentation/views/main_view.dart';

class MainRoute {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.main,
      builder: (context, state) => const MainView(),
    ),
  ];
}
