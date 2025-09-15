// lib/features/card_builder/presentation/screens/card_preview_screen.dart

import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/share_card_bottom_sheet.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class CardPreviewScreen extends StatelessWidget {
  const CardPreviewScreen({super.key, required this.card});
  static const String routeName = '/card-preview';
  final PopulatedCard card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final template = card.template;

    return Scaffold(
      body: Stack(
        children: [
          // --- Background Gradient ---
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  template.primaryColor.withOpacity(0.8),
                  template.accentColor.withOpacity(0.4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // --- Main Content ---
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(card.avatarUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    card.name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: template.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    card.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: template.accentColor.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    card.bio,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: template.accentColor.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // --- Links ---
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: card.links.length,
                    itemBuilder: (context, index) {
                      final link = card.links[index];
                      return LinkButton(
                        icon: link.icon,
                        title: link.title,
                        backgroundColor: template.accentColor.withOpacity(0.15),
                        foregroundColor: template.accentColor,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                ],
              ),
            ),
          ),
          // --- Top close button ---
          Positioned(
            top: 40,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(LucideIcons.x),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ),
          // --- Bottom Action Bar ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ).copyWith(bottom: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: theme.colorScheme.surface,
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        isScrollControlled:
                            true, // lets sheet expand fully if content is big
                        builder: (ctx) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(
                              ctx,
                            ).viewInsets.bottom, // handles keyboard overlap
                          ),
                          child: ShareCardBottomSheet(card: card),
                        ),
                      );
                    },
                    icon: const Icon(LucideIcons.share2),
                    label: const Text('Share'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      /* TODO: Navigate to Edit screen */
                    },
                    icon: const Icon(LucideIcons.pencil),
                    label: const Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({required this.link, required this.template});
  final UserLink link;
  final CardTemplate template;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: template.accentColor.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(link.icon, color: template.accentColor, size: 20),
              const SizedBox(width: 12),
              Text(
                link.title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: template.accentColor,
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
