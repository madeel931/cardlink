// lib/features/premium/presentation/screens/premium_benefits_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/pricing_plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class PremiumBenefitsScreen extends StatelessWidget {
  const PremiumBenefitsScreen({super.key});
  static const String routeName = '/premium-benefits';

  // --- Mock Data for Features ---
  static const List<Map<String, dynamic>> premiumFeatures = [
    {
      'icon': LucideIcons.layers,
      'title': 'Multiple Digital Cards',
      'description':
          'Create and manage up to 5 unique digital cards, each with its own links and branding. Perfect for different roles or businesses.',
    },
    {
      'icon': LucideIcons.infinity,
      'title': 'Unlimited Links',
      'description':
          'Add as many links as you need to your cards. Never run out of space for your social media, portfolios, and websites.',
    },
    {
      'icon': LucideIcons.chartBar,
      'title': 'Advanced Analytics',
      'description':
          'Gain deeper insights into your link performance. Track clicks by location, device, and time of day to optimize your reach.',
    },
    {
      'icon': LucideIcons.palette,
      'title': 'Custom Themes & Branding',
      'description':
          'Personalize your cards with exclusive premium themes, custom colors, and upload your own logo for a truly unique look.',
    },
    {
      'icon': LucideIcons.users,
      'title': 'Team Management',
      'description':
          'Collaborate with your team members. Manage multiple user accounts under one business plan with centralized billing.',
    },
    {
      'icon': LucideIcons.lifeBuoy,
      'title': 'Priority Support',
      'description':
          'Get quick and dedicated assistance from our support team for any questions or issues you may encounter.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Premium Features')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Unlock Exclusive Features with Premium',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Elevate your digital presence and get more from your links. Here’s what awaits you:',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // --- Features List ---
            Column(
              children: premiumFeatures
                  .map(
                    (feature) => _FeatureTile(
                      icon: feature['icon'] as IconData,
                      title: feature['title'] as String,
                      description: feature['description'] as String,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),

            // --- Call to Action ---
            PrimaryButton(
              text: 'Go Premium Now',
              onPressed: () => context.push(PricingPlansScreen.routeName),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Maybe Later'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: theme.colorScheme.onPrimaryContainer,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
