// lib/features/card_builder/data/models/populated_card_model.dart

import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:flutter/material.dart';

// Represents a link the user has added
class UserLink {
  final String title;
  final IconData icon;
  final String url;

  UserLink({required this.title, required this.icon, required this.url});
}

// Represents a fully customized card with user data
class PopulatedCard {
  final CardTemplate template;
  final String name;
  final String title;
  final String avatarUrl;
  final String bio;
  final List<UserLink> links;

  PopulatedCard({
    required this.template,
    required this.name,
    required this.title,
    required this.avatarUrl,
    required this.bio,
    required this.links,
  });
}
