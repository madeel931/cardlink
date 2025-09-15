// lib/features/utilities/presentation/screens/faqs_screen.dart

import 'package:cardlink_ui_kit/features/utilities/data/models/faq_item_model.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});
  static const String routeName = '/faqs';

  // --- Mock Data ---
  static final List<FaqItem> _faqItems = [
    FaqItem(
      question: 'What is a digital business card?',
      answer:
          'A digital business card is a modern way to share your contact information and social links. Instead of a physical card, you share a unique URL or QR code that leads to your personalized online profile, like the one you create with CardLink.',
    ),
    FaqItem(
      question: 'How do I customize my card?',
      answer:
          'After creating an account, you can choose a template and then use the Card Customizer to change colors, upload a profile picture, add your name and bio, and manage all your links.',
    ),
    FaqItem(
      question: 'Can I have more than one card?',
      answer:
          'Yes! Our Premium plans allow you to create and manage multiple cards. This is perfect for separating your work and personal contacts, or for managing different business ventures.',
    ),
    FaqItem(
      question: 'How do link analytics work?',
      answer:
          'CardLink tracks every time a visitor clicks on one of the links on your card. In the analytics section, you can see total click counts, historical trends, and other useful data to understand how your audience is engaging with your profile.',
    ),
    FaqItem(
      question: 'Is my data secure?',
      answer:
          'Absolutely. We take data security very seriously. All your information is encrypted and stored securely. For more details, please refer to our Privacy Policy.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Frequently Asked Questions')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _faqItems.length,
        itemBuilder: (context, index) {
          final item = _faqItems[index];
          return ExpansionTile(
            title: Text(
              item.question,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: theme.colorScheme.surfaceContainer,
            collapsedBackgroundColor: theme.colorScheme.surfaceContainer,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  item.answer,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }
}
