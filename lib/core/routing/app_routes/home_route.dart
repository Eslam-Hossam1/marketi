import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/home/presentation/views/home_view.dart';

class HomeRoute {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeView(),
    ),
  ];
}
