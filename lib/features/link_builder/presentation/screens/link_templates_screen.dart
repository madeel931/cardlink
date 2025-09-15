// lib/features/link_builder/presentation/screens/link_templates_screen.dart

import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/link_builder/data/models/link_template_model.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/screens/add_link_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class LinkTemplatesScreen extends StatefulWidget {
  const LinkTemplatesScreen({super.key});
  static const String routeName = '/link-templates';

  @override
  State<LinkTemplatesScreen> createState() => _LinkTemplatesScreenState();
}

class _LinkTemplatesScreenState extends State<LinkTemplatesScreen> {
  // --- Mock Data ---
  final List<LinkTemplate> _allLinkTemplates = [
    LinkTemplate(
      title: 'Website',
      subtitle: 'Link to any website',
      icon: LucideIcons.link,
      category: 'Most Popular',
    ),
    LinkTemplate(
      title: 'Contact Details',
      subtitle: 'Share your contact info (vCard)',
      icon: LucideIcons.contact,
      category: 'Most Popular',
    ),
    LinkTemplate(
      title: 'Instagram',
      subtitle: 'Display your Instagram profile',
      icon: LucideIcons.instagram,
      category: 'Social',
    ),
    LinkTemplate(
      title: 'TikTok',
      subtitle: 'Link to your TikTok profile',
      icon: LucideIcons.command,
      category: 'Social',
    ), // Using a placeholder icon
    LinkTemplate(
      title: 'X (Twitter)',
      subtitle: 'Your X profile handle',
      icon: LucideIcons.twitter,
      category: 'Social',
    ),
    LinkTemplate(
      title: 'GitHub',
      subtitle: 'Showcase your repositories',
      icon: LucideIcons.github,
      category: 'Social',
    ),
    LinkTemplate(
      title: 'LinkedIn',
      subtitle: 'Your professional network',
      icon: LucideIcons.linkedin,
      category: 'Business',
    ),
    LinkTemplate(
      title: 'Calendly',
      subtitle: 'Let people book a meeting',
      icon: LucideIcons.calendar,
      category: 'Business',
    ),
    LinkTemplate(
      title: 'Email',
      subtitle: 'Open a new email draft',
      icon: LucideIcons.mail,
      category: 'Contact',
    ),
    LinkTemplate(
      title: 'Phone Number',
      subtitle: 'Allow people to call you',
      icon: LucideIcons.phone,
      category: 'Contact',
    ),
  ];

  late List<LinkTemplate> _filteredTemplates;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTemplates = _allLinkTemplates;
    _searchController.addListener(_filterTemplates);
  }

  void _filterTemplates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTemplates = _allLinkTemplates.where((template) {
        return template.title.toLowerCase().contains(query) ||
            template.subtitle.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Link')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              controller: _searchController,
              hintText: 'Search for a link type...',
              prefixIcon: LucideIcons.search,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTemplates.length,
              itemBuilder: (context, index) {
                final template = _filteredTemplates[index];
                final showHeader =
                    index == 0 ||
                    template.category != _filteredTemplates[index - 1].category;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showHeader)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          template.category,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ),
                    ListTile(
                      leading: Icon(
                        template.icon,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(
                        template.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(template.subtitle),
                      onTap: () {
                        context.push(AddLinkScreen.routeName, extra: template);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
