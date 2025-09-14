// lib/features/auth/presentation/screens/onboarding_screen_one.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_two.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
// We'll create this in the next phase

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  static const String routeName = '/onboarding-one';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- Skip Button ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Skip')),
              ),
              const Spacer(),

              // --- Animation ---
              Lottie.asset(
                AppAssets.onboarding1,
                height: MediaQuery.sizeOf(context).height * 0.3,
                repeat: true,
              ),
              const SizedBox(height: 32),

              // --- Text Content ---
              Text(
                'Create Your Digital Card',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Showcase your brand, contact info, and links with a beautifully designed digital business card.',
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
                  _buildIndicator(isActive: true, theme: theme),
                  const SizedBox(width: 8),
                  _buildIndicator(isActive: false, theme: theme),
                  const SizedBox(width: 8),
                  _buildIndicator(isActive: false, theme: theme),
                ],
              ),
              const SizedBox(height: 32),

              // --- Next Button ---
              PrimaryButton(
                text: 'Next',
                onPressed: () {
                  // Navigate to the next onboarding screen
                  context.push(OnboardingScreenTwo.routeName);
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
    return Container(
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
