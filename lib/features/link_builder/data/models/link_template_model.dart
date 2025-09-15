// lib/features/link_builder/data/models/link_template_model.dart

import 'package:flutter/material.dart';

class LinkTemplate {
  final String title;
  final String subtitle;
  final IconData icon;
  final String category;

  LinkTemplate({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.category,
  });
}
