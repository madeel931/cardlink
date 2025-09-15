// lib/features/link_builder/presentation/screens/qr_generator_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/secondary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});
  static const String routeName = '/qr-generator';

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  Color _selectedColor = const Color(0xFF121212);
  bool _addLogo = true;

  final List<Color> _colorOptions = [
    const Color(0xFF121212),
    const Color(0xFF6A5AE0),
    const Color(0xFFD32F2F),
    const Color(0xFF388E3C),
    const Color(0xFF0288D1),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const cardUrl = 'https://cardlink.bio/jennifer'; // Mock URL

    return Scaffold(
      appBar: AppBar(title: const Text('QR Code')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- QR Code Preview ---
            CustomCard(
              padding: const EdgeInsets.all(32),
              child: QrImageView(
                data: cardUrl,
                version: QrVersions.auto,
                eyeStyle: QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: _selectedColor,
                ),
                dataModuleStyle: QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: _selectedColor,
                ),
                embeddedImage: _addLogo
                    ? const AssetImage(AppAssets.logoIcon)
                    : null,
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(40, 40),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- Customization Panel ---
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customize', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  const Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _colorOptions
                        .map((color) => _buildColorSwatch(color))
                        .toList(),
                  ),
                  const Divider(height: 32),
                  SwitchListTile(
                    title: const Text(
                      'Add Logo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: _addLogo,
                    onChanged: (value) => setState(() => _addLogo = value),
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- Action Buttons ---
            PrimaryButton(text: 'Download PNG', onPressed: () {}),
            const SizedBox(height: 12),
            SecondaryButton(text: 'Share QR Code', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSwatch(Color color) {
    bool isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => _selectedColor = color),
      child: Material(
        elevation: isSelected ? 4 : 0,
        shape: const CircleBorder(),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: isSelected
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
