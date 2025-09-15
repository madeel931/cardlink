// lib/features/utilities/presentation/screens/contact_support_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});
  static const String routeName = '/contact-support';

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  // Mock data for the dropdown
  final List<String> _topics = [
    'General Inquiry',
    'Billing Issue',
    'Bug Report',
    'Feature Request',
  ];
  String? _selectedTopic;

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Support')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Header ---
            Text(
              'We\'re here to help!',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please fill out the form below and our team will get back to you as soon as possible.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),

            // --- Form ---
            // Topic Dropdown
            DropdownButtonFormField<String>(
              initialValue: _selectedTopic,
              hint: const Text('Select a Topic'),
              decoration: InputDecoration(
                prefixIcon: const Icon(LucideIcons.list, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: _topics.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTopic = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            // Subject Field
            CustomTextField(
              controller: _subjectController,
              labelText: 'Subject',
              prefixIcon: LucideIcons.type,
            ),
            const SizedBox(height: 16),
            // Message Field
            CustomTextField(
              controller: _messageController,
              labelText: 'Message',
              hintText: 'Please describe your issue in detail...',
              prefixIcon: LucideIcons.messageSquare,
              maxLines: 6,
            ),
            const SizedBox(height: 32),
            // Submit Button
            PrimaryButton(
              text: 'Submit Ticket',
              onPressed: () {
                // TODO: Implement submission logic
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Your support ticket has been submitted!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
