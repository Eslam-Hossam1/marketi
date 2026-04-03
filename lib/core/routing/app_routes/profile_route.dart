import 'package:go_router/go_router.dart';
import '../routes_paths.dart';
import '../../../../features/profile/presentation/views/profile_view.dart';

class ProfileRoute {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.profile,
      builder: (context, state) => const ProfileView(),
    ),
  ];
}
