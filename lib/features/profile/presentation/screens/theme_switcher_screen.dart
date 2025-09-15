// lib/features/profile/presentation/screens/theme_switcher_screen.dart

import 'package:cardlink_ui_kit/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ThemeSwitcherScreen extends StatelessWidget {
  const ThemeSwitcherScreen({super.key});
  static const String routeName = '/theme-switcher';

  @override
  Widget build(BuildContext context) {
    // Watch the cubit to get the current state for the UI
    final currentThemeMode = context.watch<ThemeCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _ThemeOptionCard(
              label: 'Light',
              icon: LucideIcons.sun,
              isSelected: currentThemeMode == ThemeMode.light,
              onTap: () {
                // Read the cubit to call its method
                context.read<ThemeCubit>().changeTheme(ThemeMode.light);
              },
            ),
            const SizedBox(height: 16),
            _ThemeOptionCard(
              label: 'Dark',
              icon: LucideIcons.moon,
              isSelected: currentThemeMode == ThemeMode.dark,
              onTap: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
              },
            ),
            const SizedBox(height: 16),
            _ThemeOptionCard(
              label: 'System Default',
              icon: LucideIcons.laptop,
              isSelected: currentThemeMode == ThemeMode.system,
              onTap: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.system);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: isSelected
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurface,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              if (isSelected)
                Icon(
                  LucideIcons.circleCheck,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
