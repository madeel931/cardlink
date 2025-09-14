// lib/features/auth/presentation/screens/splash_screen.dart

import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startDelayAndNavigate();
  }

  /// Simulates an initialization delay and then navigates to the next screen.
  Future<void> _startDelayAndNavigate() async {
    // Wait for 3 seconds to simulate loading, etc.
    await Future.delayed(const Duration(seconds: 3));

    // In a real app, you'd check auth status here.
    // For now, we'll always go to onboarding.
    if (mounted) {
      // Use `go` to replace the splash screen in the navigation stack,
      // so the user can't press "back" to return to it.
      context.go(OnboardingScreenOne.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.link, size: 80, color: primaryColor),
            const SizedBox(height: 24),
            Text(
              'CardLink',
              style: textTheme.displaySmall?.copyWith(color: primaryColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Your Digital Identity, Perfected.',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 64),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
