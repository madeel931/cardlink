// lib/features/link_builder/presentation/widgets/link_preview_bottom_sheet.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/widgets/link_button.dart';
import 'package:cardlink_ui_kit/features/link_builder/data/models/link_template_model.dart';
import 'package:flutter/material.dart';

class LinkPreviewBottomSheet extends StatelessWidget {
  const LinkPreviewBottomSheet({
    super.key,
    required this.template,
    required this.title,
  });

  final LinkTemplate template;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Link Preview',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'This is how your link will appear on your card.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          // --- Mock Card Context ---
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: LinkButton(
              icon: template.icon,
              title: title.isEmpty ? template.title : title,
              backgroundColor: Colors.white.withOpacity(0.15),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: 'Looks Good, Add Link',
            onPressed: () =>
                Navigator.of(context).pop(true), // Pop with a success value
          ),
        ],
      ),
    );
  }
}
