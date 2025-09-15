// lib/features/premium/presentation/screens/restore_purchases_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class RestorePurchasesScreen extends StatelessWidget {
  const RestorePurchasesScreen({super.key});
  static const String routeName = '/restore-purchases';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Restore Purchases')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // --- Header ---
              Icon(
                LucideIcons.refreshCw,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Already a Premium Member?',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'If you\'ve previously purchased a subscription, tap the button below to restore your access on this device.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),

              // --- Action Button ---
              PrimaryButton(
                text: 'Restore Purchases',
                onPressed: () {
                  // TODO: Implement restore purchase logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Searching for previous purchases...'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
