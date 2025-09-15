// lib/features/profile/presentation/screens/security_settings_screen.dart

import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});
  static const String routeName = '/security-settings';

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _isTwoFactorEnabled = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Security')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Change Password Section ---
            CustomCard(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                leading: const Icon(LucideIcons.keyRound),
                title: const Text('Change Password'),
                trailing: const Icon(LucideIcons.chevronRight, size: 16),
                onTap: () => context.push(ChangePasswordScreen.routeName),
              ),
            ),
            const SizedBox(height: 24),

            // --- Two-Factor Authentication Section ---
            CustomCard(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: SwitchListTile(
                title: const Text('Two-Factor Authentication'),
                subtitle: Text(
                  'Add an extra layer of security to your account.',
                  style: theme.textTheme.bodySmall,
                ),
                secondary: const Icon(LucideIcons.smartphone),
                value: _isTwoFactorEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isTwoFactorEnabled = value;
                  });
                  // In a real app, this would trigger the 2FA setup flow.
                },
              ),
            ),
            const SizedBox(height: 24),

            // --- Login Activity Section ---
            CustomCard(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                leading: const Icon(LucideIcons.history),
                title: const Text('Login Activity'),
                subtitle: const Text(
                  'Last seen from Gujranwala, Pakistan',
                ), // Mock location
                trailing: const Icon(LucideIcons.chevronRight, size: 16),
                onTap: () {
                  // TODO: Navigate to Login Activity screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
