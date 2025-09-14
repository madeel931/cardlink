import 'package:cardlink_ui_kit/features/auth/presentation/screens/splash_screen.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/component_gallery_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    // For this phase, we start at the gallery. Change back to '/' for production.
    initialLocation: ComponentGalleryScreen.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: ComponentGalleryScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ComponentGalleryScreen();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.toString()}')),
    ),
  );
}
