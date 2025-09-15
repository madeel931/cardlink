// lib/features/premium/presentation/screens/manage_subscription_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/secondary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ManageSubscriptionScreen extends StatelessWidget {
  const ManageSubscriptionScreen({super.key});
  static const String routeName = '/manage-subscription';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Subscription')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Current Plan Card ---
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CURRENT PLAN', style: theme.textTheme.labelMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const CircleAvatar(child: Icon(LucideIcons.gem)),
                      const SizedBox(width: 12),
                      Text(
                        'CardLink Pro',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  _buildInfoRow('Price', '\$99.99/year'),
                  const SizedBox(height: 8),
                  _buildInfoRow('Next Billing Date', 'Oct 15, 2026'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- Plan Features ---
            Text('Your Plan Includes', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildFeatureTile(context, '5 Digital Cards'),
            _buildFeatureTile(context, 'Unlimited Links'),
            _buildFeatureTile(context, 'Advanced Analytics'),
            _buildFeatureTile(context, 'Custom Themes'),
            const SizedBox(height: 32),

            // --- Action Buttons ---
            SecondaryButton(text: 'Change Plan', onPressed: () {}),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: () => _showCancelConfirmationDialog(context),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
                child: const Text('Cancel Subscription'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFeatureTile(BuildContext context, String feature) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        LucideIcons.check,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(feature),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel Subscription?'),
        content: const Text(
          'Your premium benefits will remain active until your next billing date. Are you sure you want to cancel?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Stay Premium'),
          ),
          FilledButton.tonal(
            onPressed: () {
              // TODO: Implement cancel logic
              Navigator.of(ctx).pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
            child: const Text('Confirm Cancellation'),
          ),
        ],
      ),
    );
  }
}
