// lib/features/premium/presentation/screens/confirmation_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});
  static const String routeName = '/confirmation';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // --- Animation ---
              Lottie.asset(AppAssets.success, height: 200, repeat: false),
              const SizedBox(height: 32),

              // --- Text Content ---
              Text(
                'You\'re All Set!',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Your payment was successful. You now have access to all premium features. Enjoy!',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Spacer(),

              // --- Action Button ---
              PrimaryButton(
                text: 'Back to Dashboard',
                onPressed: () => context.go(DashboardScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
