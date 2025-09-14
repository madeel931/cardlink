import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Manages the application's theme (`ThemeMode.light`, `ThemeMode.dark`, `ThemeMode.system`).
///
/// Extends [HydratedCubit] to automatically persist the theme preference
/// across app restarts.
class ThemeCubit extends HydratedCubit<ThemeMode> {
  // The initial state is set to `ThemeMode.system`.
  ThemeCubit() : super(ThemeMode.system);

  /// Changes the current theme and emits the new state.
  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  /// Called by HydratedCubit to restore the state from a serialized map.
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      // The stored value is the enum's name (e.g., 'dark').
      // We find the matching enum value from the string.
      return ThemeMode.values.byName(json['theme_mode'] as String);
    } catch (_) {
      // If parsing fails (e.g., data corruption), default to system theme.
      return ThemeMode.system;
    }
  }

  /// Called by HydratedCubit to serialize the state to a map for storage.
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // We store the enum's name as a string.
    return {'theme_mode': state.name};
  }
}
