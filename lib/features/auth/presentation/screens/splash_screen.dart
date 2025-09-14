import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  /// The route name for navigating to this screen.
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    // Using Theme.of(context) to ensure colors and styles adapt to light/dark mode.
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
          ],
        ),
      ),
    );
  }
}
