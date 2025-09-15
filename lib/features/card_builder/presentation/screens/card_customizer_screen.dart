// lib/features/card_builder/presentation/screens/card_customizer_screen.dart

import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/widgets/share_specific_link_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class CardCustomizerScreen extends StatefulWidget {
  const CardCustomizerScreen({super.key, required this.template});
  static const String routeName = '/card-customizer';
  final CardTemplate template;

  @override
  State<CardCustomizerScreen> createState() => _CardCustomizerScreenState();
}

class _CardCustomizerScreenState extends State<CardCustomizerScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Jennifer Lee');
    _titleController = TextEditingController(text: 'UI/UX Designer');

    _nameController.addListener(() => setState(() {}));
    _titleController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This mock data is used to populate the link fields below
    final mockLinks = [
      UserLink(
        title: 'LinkedIn',
        icon: LucideIcons.linkedin,
        url: 'linkedin.com/in/username',
      ),
      UserLink(
        title: 'GitHub',
        icon: LucideIcons.github,
        url: 'github.com/username',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Card'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(onPressed: () {}, child: const Text('Save')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LiveCardPreview(
              template: widget.template,
              name: _nameController.text,
              title: _titleController.text,
            ),
            const SizedBox(height: 32),
            Text(
              'Profile Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 24),
            CustomTextField(
              controller: _nameController,
              labelText: 'Display Name',
              prefixIcon: LucideIcons.user,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _titleController,
              labelText: 'Title / Headline',
              prefixIcon: LucideIcons.briefcase,
            ),
            const SizedBox(height: 32),
            Text(
              'Social Links',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 24),
            // We now pass the full mockLink object to our updated helper widget
            _SocialLinkField(link: mockLinks[0]),
            const SizedBox(height: 16),
            _SocialLinkField(link: mockLinks[1]),
          ],
        ),
      ),
    );
  }
}

// This helper widget is unchanged from Phase 17
class _LiveCardPreview extends StatelessWidget {
  const _LiveCardPreview({
    required this.template,
    required this.name,
    required this.title,
  });

  final CardTemplate template;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: template.accentColor.withOpacity(0.8),
              child: Icon(
                LucideIcons.user,
                size: 35,
                color: template.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty ? 'Your Name' : name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: template.accentColor),
                ),
                Text(
                  title.isEmpty ? 'Your Title' : title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: template.accentColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// KEY CHANGE: This helper widget was updated in Phase 26
class _SocialLinkField extends StatelessWidget {
  const _SocialLinkField({required this.link});
  final UserLink link;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      // A key helps Flutter identify the widget correctly if the list were dynamic
      key: ValueKey(link.title),
      initialValue: link.url,
      prefixIcon: link.icon,
      suffixIcon: IconButton(
        icon: const Icon(LucideIcons.ellipsisVertical, size: 20),
        onPressed: () {
          // This is the new functionality to show the share sheet
          showModalBottomSheet(
            context: context,
            builder: (ctx) => ShareSpecificLinkBottomSheet(link: link),
            backgroundColor: Theme.of(context).colorScheme.surface,
          );
        },
      ),
    );
  }
}
