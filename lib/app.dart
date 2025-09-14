import 'package:cardlink_ui_kit/core/routing/app_router.dart';
import 'package:cardlink_ui_kit/core/theme/app_theme.dart';
import 'package:cardlink_ui_kit/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The root widget of the CardLink application.
class CardLinkApp extends StatelessWidget {
  const CardLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the ThemeCubit to the entire widget tree.
    return BlocProvider(
      create: (_) => ThemeCubit(),
      // BlocBuilder rebuilds the UI when the ThemeCubit's state changes.
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'CardLink',

            // Themes from our AppTheme class.
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,

            // The themeMode is now dynamically controlled by the ThemeCubit's state.
            themeMode: themeMode,

            // Router configuration.
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
