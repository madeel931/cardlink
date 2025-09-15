// lib/features/utilities/presentation/screens/help_center_screen.dart

import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/app_walkthrough_screen.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/contact_support_screen.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});
  static const String routeName = '/help-center';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Search Bar ---
            const CustomTextField(
              hintText: 'Search for help...',
              prefixIcon: LucideIcons.search,
            ),
            const SizedBox(height: 24),

            // --- Category Grid ---
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildCategoryCard(
                  context,
                  icon: LucideIcons.listTodo,
                  label: 'App Walkthrough',
                  onTap: () => context.push(AppWalkthroughScreen.routeName),
                ),
                _buildCategoryCard(
                  context,
                  icon: LucideIcons.fileQuestionMark,
                  label: 'FAQs',
                  onTap: () => context.push(FaqsScreen.routeName),
                ),
                _buildCategoryCard(
                  context,
                  icon: LucideIcons.messageCircle,
                  label: 'Contact Support',
                  onTap: () => context.push(ContactSupportScreen.routeName),
                ),
                _buildCategoryCard(
                  context,
                  icon: LucideIcons.book,
                  label: 'User Guides',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // --- Top Questions ---
            Text(
              'Top Questions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            CustomCard(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  _buildQuestionTile(context, 'How do I customize my card?'),
                  const Divider(indent: 16, endIndent: 16),
                  _buildQuestionTile(context, 'How does link analytics work?'),
                  const Divider(indent: 16, endIndent: 16),
                  _buildQuestionTile(context, 'What are the premium benefits?'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return CustomCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 32),
          const SizedBox(height: 12),
          Text(
            label,
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionTile(BuildContext context, String question) {
    return ListTile(
      title: Text(question, style: Theme.of(context).textTheme.bodyLarge),
      trailing: const Icon(LucideIcons.chevronRight, size: 16),
      onTap: () {
        // TODO: Navigate to specific FAQ answer
      },
    );
  }
}
