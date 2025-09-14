// lib/features/card_builder/presentation/screens/add_new_card_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/explore_templates_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});
  static const String routeName = '/add-new-card';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Card')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // --- Header ---
              Icon(
                LucideIcons.contact,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Give your card a name',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'This will help you identify it later if you manage multiple cards (e.g., "Work Card", "Personal").',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),

              // --- Card Name Field ---
              const CustomTextField(
                labelText: 'Card Name',
                hintText: 'e.g. My Work Card',
              ),
              const Spacer(),

              // --- Continue Button ---
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  // Navigate to the template selection screen
                  context.push(ExploreTemplatesScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
