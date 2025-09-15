// lib/features/profile/presentation/screens/edit_profile_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String routeName = '/edit-profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Jennifer Lee');
    _bioController = TextEditingController(
      text:
          'Creating beautiful and intuitive digital experiences. Based in Gujranwala, Pakistan.',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                // TODO: Implement save logic
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // --- Profile Picture Editor ---
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppAssets.avatar),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: const Icon(
                        LucideIcons.camera,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // TODO: Implement image picker logic
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // --- Form Fields ---
            CustomTextField(
              controller: _nameController,
              labelText: 'Full Name',
              prefixIcon: LucideIcons.user,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bioController,
              labelText: 'Bio / Headline',
              prefixIcon: LucideIcons.squarePen,
              maxLines: 4, // Use the new maxLines property
            ),
          ],
        ),
      ),
    );
  }
}
