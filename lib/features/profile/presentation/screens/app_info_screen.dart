// lib/features/profile/presentation/screens/app_info_screen.dart

import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({super.key});
  static const String routeName = '/app-info';

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  String _version = '...';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version =
            'Version ${packageInfo.version} (${packageInfo.buildNumber})';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('App Info')),
      body: Column(
        children: [
          const Spacer(),
          // --- App Header ---
          Icon(LucideIcons.link, size: 60, color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          Text('CardLink', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(
            _version,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 48),

          // --- Info Links ---
          ListTile(
            leading: const Icon(LucideIcons.fileText),
            title: const Text('Terms of Service'),
            trailing: const Icon(LucideIcons.chevronRight, size: 16),
            onTap: () {
              /* TODO: Navigate to Terms of Service URL/Page */
            },
          ),
          ListTile(
            leading: const Icon(LucideIcons.shield),
            title: const Text('Privacy Policy'),
            trailing: const Icon(LucideIcons.chevronRight, size: 16),
            onTap: () {
              /* TODO: Navigate to Privacy Policy URL/Page */
            },
          ),
          ListTile(
            leading: const Icon(LucideIcons.code),
            title: const Text('Open Source Licenses'),
            trailing: const Icon(LucideIcons.chevronRight, size: 16),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: 'CardLink',
                applicationVersion: _version,
              );
            },
          ),
          const Spacer(),

          // --- Copyright Footer ---
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              '© ${DateTime.now().year} CardLink. All Rights Reserved.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
