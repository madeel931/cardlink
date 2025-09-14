// lib/features/card_builder/presentation/screens/template_preview_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/card_customizer_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class TemplatePreviewScreen extends StatelessWidget {
  const TemplatePreviewScreen({super.key, required this.template});
  static const String routeName = '/template-preview';
  final CardTemplate template;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(template.name)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            // --- The main card preview widget ---
            _CardPreviewWidget(template: template),
            const Spacer(),
            // --- Action button ---
            PrimaryButton(
              text: 'Use This Template',
              onPressed: () {
                // TODO: Navigate to Card Customizer screen with this template
                context.push(CardCustomizerScreen.routeName, extra: template);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// A local helper widget to render the mock card preview.
class _CardPreviewWidget extends StatelessWidget {
  const _CardPreviewWidget({required this.template});
  final CardTemplate template;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16, // A vertical card aspect ratio
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              template.primaryColor,
              template.accentColor.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: template.primaryColor.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Mock Profile Info ---
            CircleAvatar(
              radius: 50,
              backgroundColor: template.accentColor.withOpacity(0.8),
              child: Icon(
                LucideIcons.user,
                size: 50,
                color: template.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 12,
              width: 150,
              decoration: BoxDecoration(
                color: template.accentColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 10,
              width: 100,
              decoration: BoxDecoration(
                color: template.accentColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Spacer(),
            // --- Mock Links ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => CircleAvatar(
                  radius: 24,
                  backgroundColor: template.accentColor.withOpacity(0.3),
                  child: Icon(
                    [
                      LucideIcons.instagram,
                      LucideIcons.github,
                      LucideIcons.twitter,
                      LucideIcons.linkedin,
                    ][index],
                    color: template.accentColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
