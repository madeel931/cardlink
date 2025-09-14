// lib/features/auth/presentation/screens/onboarding_screen_two.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_three.dart'; // Will be created in Phase 9

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  static const String routeName = '/onboarding-two';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // The AppBar provides a back button automatically thanks to go_router.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              const Spacer(),

              // --- Animation ---
              Lottie.asset(
                AppAssets.onboarding2,
                height: MediaQuery.sizeOf(context).height * 0.3,
                repeat: true,
              ),
              const SizedBox(height: 32),

              // --- Text Content ---
              Text(
                'Add All Your Links',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Consolidate your social media, websites, and projects into a single, elegant link.',
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
                  _buildIndicator(
                    isActive: true,
                    theme: theme,
                  ), // Second dot is active
                  const SizedBox(width: 8),
                  _buildIndicator(isActive: false, theme: theme),
                ],
              ),
              const SizedBox(height: 32),

              // --- Next Button ---
              PrimaryButton(
                text: 'Next',
                onPressed: () {
                  // Navigate to the final onboarding screen
                  context.push(OnboardingScreenThree.routeName);
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
