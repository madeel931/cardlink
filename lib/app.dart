import 'package:cardlink_ui_kit/core/routing/app_router.dart';
import 'package:cardlink_ui_kit/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// The root widget of the CardLink application.
///
/// This widget is now configured to use [MaterialApp.router] to integrate
/// our custom theme and the go_router navigation system.
class CardLinkApp extends StatelessWidget {
  const CardLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CardLink',

      // --- Themes ---
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Automatically adapts to device theme
      // --- Router ---
      routerConfig: AppRouter.router,
    );
  }
}
