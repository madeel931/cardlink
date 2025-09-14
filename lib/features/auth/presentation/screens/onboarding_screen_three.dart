// lib/features/auth/presentation/screens/onboarding_screen_three.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  static const String routeName = '/onboarding-three';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              const Spacer(),

              // --- Animation ---
              Lottie.asset(
                AppAssets.onboarding3,
                height: MediaQuery.sizeOf(context).height * 0.3,
                repeat: true,
              ),
              const SizedBox(height: 32),

              // --- Text Content ---
              Text(
                'Track Your Performance',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Gain insights into your card\'s performance with detailed analytics on views, clicks, and engagement.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // --- Page Indicator ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(isActive: false, theme: theme),
                  const SizedBox(width: 8),
                  _buildIndicator(isActive: false, theme: theme),
                  const SizedBox(width: 8),
                  _buildIndicator(
                    isActive: true,
                    theme: theme,
                  ), // Third dot is active
                ],
              ),
              const SizedBox(height: 32),

              // --- Get Started Button ---
              PrimaryButton(
                text: 'Get Started',
                onPressed: () {
                  // Use `go` to clear the onboarding stack and navigate to the login screen.
                  context.go(LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget to build the page indicator dots.
  Widget _buildIndicator({required bool isActive, required ThemeData theme}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
