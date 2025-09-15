// lib/features/profile/presentation/screens/profile_page.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/app_info_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/security_settings_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/theme_switcher_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context, theme),
            const SizedBox(height: 16),
            _buildSection(
              context,
              title: 'ACCOUNT',
              tiles: [
                _buildListTile(
                  context,
                  title: 'Edit Profile',
                  icon: LucideIcons.user,
                  onTap: () => context.push(EditProfileScreen.routeName),
                ),
                _buildListTile(
                  context,
                  title: 'Account Settings',
                  icon: LucideIcons.settings2,
                  onTap: () => context.push(AccountSettingsScreen.routeName),
                ),
                _buildListTile(
                  context,
                  title: 'Security',
                  icon: LucideIcons.shield,
                  onTap: () => context.push(SecuritySettingsScreen.routeName),
                ),
              ],
            ),
            _buildSection(
              context,
              title: 'APPEARANCE',
              tiles: [
                _buildListTile(
                  context,
                  title: 'Theme',
                  icon: LucideIcons.sunMoon,
                  onTap: () => context.push(ThemeSwitcherScreen.routeName),
                ),
              ],
            ),
            _buildSection(
              context,
              title: 'SUPPORT & INFO',
              tiles: [
                _buildListTile(
                  context,
                  title: 'Help Center',
                  icon: LucideIcons.circleQuestionMark,
                  onTap: () {},
                ),
                _buildListTile(
                  context,
                  title: 'Contact Support',
                  icon: LucideIcons.messageSquare,
                  onTap: () {},
                ),
                _buildListTile(
                  context,
                  title: 'App Info',
                  icon: LucideIcons.info,
                  onTap: () => context.push(AppInfoScreen.routeName),
                ),
              ],
            ),
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(
                  LucideIcons.logOut,
                  color: theme.colorScheme.error,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {
                  // TODO: Implement Logout logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(AppAssets.avatar),
          ),
          const SizedBox(height: 12),
          Text('Jennifer Lee', style: theme.textTheme.titleLarge),
          Text(
            'jennifer.lee@example.com',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> tiles,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(children: tiles),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title),
      trailing: const Icon(LucideIcons.chevronRight, size: 16),
      onTap: onTap,
    );
  }
}
