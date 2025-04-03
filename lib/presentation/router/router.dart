import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/favorites/favorites_screen_wrapper.dart';
import '../pages/home/home_screen_wrapper.dart';
import '../widgets/bottom_navigation_wrapper.dart';

class AppNavigation {
  static const initial = '/home';

  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorFavorites =
      GlobalKey<NavigatorState>(debugLabel: 'shellFavorites');

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    navigatorKey: _rootNavigationKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreenWrapper(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorFavorites,
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoritesScreenWrapper(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
