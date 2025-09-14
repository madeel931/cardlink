import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

/// The main entry point for the CardLink UI Kit.
///
/// This function initializes the Flutter application. In later phases, it will
/// also handle service initializations like local database (Hive),
/// state management (Bloc observer), and environment setup.
void main() {
  // Ensure that Flutter widgets are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred screen orientations. For a mobile-focused app,
  // portrait mode is often preferred.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the main application widget.
  runApp(const CardLinkApp());
}
