// lib/features/card_builder/data/models/template_model.dart

import 'package:flutter/material.dart';

class CardTemplate {
  final String id;
  final String name;
  final bool isPremium;
  final Color primaryColor;
  final Color accentColor;

  CardTemplate({
    required this.id,
    required this.name,
    required this.isPremium,
    required this.primaryColor,
    required this.accentColor,
  });
}
