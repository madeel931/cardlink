// lib/features/utilities/presentation/screens/status_screen.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({
    super.key,
    required this.lottieAsset,
    required this.title,
    required this.subtitle,
    this.actionButton,
  });

  final String lottieAsset;
  final String title;
  final String subtitle;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  lottieAsset,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                const SizedBox(height: 32),
                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (actionButton != null) ...[
                  const SizedBox(height: 40),
                  actionButton!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
