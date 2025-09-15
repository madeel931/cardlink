// lib/features/profile/presentation/screens/account_settings_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});
  static const String routeName = '/account-settings';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Email Section ---
            _buildSectionHeader(context, 'Email Address'),
            const SizedBox(height: 8),
            _buildInfoTile(
              context,
              icon: LucideIcons.mail,
              title: 'jennifer.lee@example.com',
              trailing: Text(
                'Verified',
                style: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Connected Accounts Section ---
            _buildSectionHeader(context, 'Connected Accounts'),
            const SizedBox(height: 8),
            _buildInfoTile(
              context,
              svgIconPath: AppAssets.googleIcon,
              title: 'Google',
              subtitle: 'jennifer.lee@gmail.com',
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Disconnect'),
              ),
            ),
            const SizedBox(height: 32),

            // --- Danger Zone ---
            _buildSectionHeader(context, 'Danger Zone'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.error),
              ),
              child: ListTile(
                leading: Icon(
                  LucideIcons.trash2,
                  color: theme.colorScheme.error,
                ),
                title: Text(
                  'Delete Account',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                onTap: () {
                  _showDeleteConfirmationDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }

  Widget _buildInfoTile(
    BuildContext context, {
    IconData? icon,
    String? svgIconPath,
    required String title,
    String? subtitle,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: svgIconPath != null
            ? SvgPicture.asset(svgIconPath, height: 24, width: 24)
            : Icon(icon, size: 22),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing,
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'This action is irreversible. All your data, cards, and links will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            onPressed: () {
              // TODO: Implement delete logic
              Navigator.of(ctx).pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
  }
}
