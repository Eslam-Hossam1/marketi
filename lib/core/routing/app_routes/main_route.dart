import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/cart/presentation/views/cart_view.dart';
import 'package:nextcart/features/favorites/presentation/views/favorites_view.dart';
import 'package:nextcart/features/home/presentation/views/home_view.dart';
import 'package:nextcart/features/main/presentation/views/main_view.dart';
import 'package:nextcart/features/profile/presentation/views/profile_view.dart';

class MainRoute {
  static List<RouteBase> routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainView(navigationShell: navigationShell);
      },
      branches: [
        // ── Branch 0 · Home ──────────────────────────────────────────────
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),

        // ── Branch 1 · Cart ──────────────────────────────────────────────
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.cart,
              builder: (context, state) => const CartView(),
            ),
          ],
        ),

        // ── Branch 2 · Favorites ─────────────────────────────────────────
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.favorites,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),

        // ── Branch 3 · Profile ───────────────────────────────────────────
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.profile,
              builder: (context, state) => const ProfileView(),
            ),
          ],
        ),
      ],
    ),
  ];
}
