import 'package:flutter/material.dart';

/// A reusable card widget with consistent padding, border radius, and theme-adaptive color.
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const CustomCard({super.key, required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.brightness == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade800,
          width: 1,
        ),
      ),
      color: theme.colorScheme.surface,
      clipBehavior:
          Clip.antiAlias, // Ensures content respects the border radius
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
