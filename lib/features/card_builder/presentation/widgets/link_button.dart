// lib/features/card_builder/presentation/widgets/link_button.dart

import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor ?? theme.colorScheme.surface.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: foregroundColor ?? theme.colorScheme.onSurface,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: foregroundColor ?? theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
