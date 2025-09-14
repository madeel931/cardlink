import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/secondary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// A screen for developers to preview and test all core reusable components.
class ComponentGalleryScreen extends StatefulWidget {
  const ComponentGalleryScreen({super.key});

  static const String routeName = '/component-gallery';

  @override
  State<ComponentGalleryScreen> createState() => _ComponentGalleryScreenState();
}

class _ComponentGalleryScreenState extends State<ComponentGalleryScreen> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Gallery')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Buttons Section
          Text('Buttons', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: _toggleLoading,
            text: 'Primary Button',
            icon: const Icon(LucideIcons.arrowRight, size: 18),
            isLoading: _isLoading,
          ),
          const SizedBox(height: 12),
          const PrimaryButton(
            onPressed: null,
            text: 'Primary Disabled',
            icon: Icon(LucideIcons.x, size: 18),
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            onPressed: () {},
            text: 'Secondary Button',
            icon: const Icon(LucideIcons.check, size: 18),
          ),
          const SizedBox(height: 12),
          const SecondaryButton(onPressed: null, text: 'Secondary Disabled'),
          const SizedBox(height: 12),
          TextButton(onPressed: () {}, child: const Text('Text Button')),

          const Divider(height: 48),

          // Text Fields Section
          Text('Text Fields', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          const CustomTextField(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            prefixIcon: LucideIcons.mail,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: LucideIcons.lock,
            suffixIcon: Icon(LucideIcons.eyeOff, size: 20),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: 'Text field with an error',
            autovalidateMode: AutovalidateMode.always,
            validator: (_) => 'This is an example error message.',
            decoration: InputDecoration(
              labelText: 'Error State',
              prefixIcon: const Icon(LucideIcons.triangleAlert, size: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const Divider(height: 48),

          // Cards Section
          Text('Cards', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          CustomCard(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Standard Card',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'This is a CustomCard widget. It has consistent styling and can be tapped.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
