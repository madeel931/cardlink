// lib/features/card_builder/presentation/screens/explore_templates_screen.dart

import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/template_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ExploreTemplatesScreen extends StatefulWidget {
  const ExploreTemplatesScreen({super.key});
  static const String routeName = '/explore-templates';

  @override
  State<ExploreTemplatesScreen> createState() => _ExploreTemplatesScreenState();
}

class _ExploreTemplatesScreenState extends State<ExploreTemplatesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // --- Mock Data ---
  final List<CardTemplate> _allTemplates = [
    CardTemplate(
      id: '1',
      name: 'Minimalist Dark',
      isPremium: false,
      primaryColor: Colors.black,
      accentColor: Colors.white,
    ),
    CardTemplate(
      id: '2',
      name: 'Corporate Blue',
      isPremium: false,
      primaryColor: Colors.blue.shade800,
      accentColor: Colors.lightBlue.shade100,
    ),
    CardTemplate(
      id: '3',
      name: 'Gradient Sunset',
      isPremium: true,
      primaryColor: Colors.orange.shade700,
      accentColor: Colors.pink.shade300,
    ),
    CardTemplate(
      id: '4',
      name: 'Emerald Green',
      isPremium: false,
      primaryColor: Colors.green.shade800,
      accentColor: Colors.lightGreen.shade200,
    ),
    CardTemplate(
      id: '5',
      name: 'Royal Purple',
      isPremium: true,
      primaryColor: Colors.deepPurple.shade700,
      accentColor: Colors.purple.shade200,
    ),
    CardTemplate(
      id: '6',
      name: 'Modern Light',
      isPremium: false,
      primaryColor: Colors.grey.shade200,
      accentColor: Colors.black,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<CardTemplate> _getFilteredTemplates() {
    if (_tabController.index == 1) {
      return _allTemplates.where((t) => !t.isPremium).toList();
    }
    if (_tabController.index == 2) {
      return _allTemplates.where((t) => t.isPremium).toList();
    }
    return _allTemplates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Templates'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Free'),
            Tab(text: 'Premium'),
          ],
          onTap: (_) => setState(() {}), // Rebuild on tap
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTemplateGrid(_allTemplates),
          _buildTemplateGrid(_allTemplates.where((t) => !t.isPremium).toList()),
          _buildTemplateGrid(_allTemplates.where((t) => t.isPremium).toList()),
        ],
      ),
    );
  }

  Widget _buildTemplateGrid(List<CardTemplate> templates) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: templates.length,
      itemBuilder: (context, index) {
        final template = templates[index];
        return _TemplateGridItem(template: template);
      },
    );
  }
}

class _TemplateGridItem extends StatelessWidget {
  const _TemplateGridItem({required this.template});
  final CardTemplate template;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomCard(
      onTap: () =>
          context.push(TemplatePreviewScreen.routeName, extra: template),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Mock Card Preview ---
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    template.primaryColor,
                    template.accentColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 8,
                    width: 60,
                    color: template.accentColor.withOpacity(0.8),
                    margin: const EdgeInsets.only(bottom: 4),
                  ),
                  Container(
                    height: 6,
                    width: 40,
                    color: template.accentColor.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // --- Template Name & Badge ---
          Row(
            children: [
              Expanded(
                child: Text(
                  template.name,
                  style: theme.textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (template.isPremium)
                const Icon(LucideIcons.gem, size: 14, color: Colors.deepPurple),
            ],
          ),
        ],
      ),
    );
  }
}
