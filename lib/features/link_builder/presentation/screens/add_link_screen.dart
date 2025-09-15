// lib/features/link_builder/presentation/screens/add_link_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/link_builder/data/models/link_template_model.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/widgets/link_preview_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
// ... other imports

class AddLinkScreen extends StatefulWidget {
  // <-- Change to StatefulWidget
  const AddLinkScreen({super.key, required this.template});

  static const String routeName = '/add-link';
  final LinkTemplate template;

  @override
  State<AddLinkScreen> createState() => _AddLinkScreenState();
}

class _AddLinkScreenState extends State<AddLinkScreen> {
  final _titleController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _showPreview() async {
    // Hide keyboard before showing bottom sheet
    FocusManager.instance.primaryFocus?.unfocus();

    final result = await showModalBottomSheet<bool>(
      context: context,
      builder: (ctx) => LinkPreviewBottomSheet(
        template: widget.template,
        title: _titleController.text,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );

    if (result == true && mounted) {
      // TODO: Implement logic to save the link
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Add ${widget.template.title}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your link details',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Add a title and the URL for your ${widget.template.title.toLowerCase()} link.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),
              CustomTextField(
                controller: _titleController,
                labelText: 'Title',
                hintText: 'e.g. My Portfolio',
                prefixIcon: LucideIcons.type,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _urlController,
                labelText: 'URL',
                hintText: 'https://example.com',
                prefixIcon: widget.template.icon,
                keyboardType: TextInputType.url,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Preview Link', // <-- Text changed
                onPressed: _showPreview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
