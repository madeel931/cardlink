// lib/features/card_builder/presentation/widgets/share_card_bottom_sheet.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ShareCardBottomSheet extends StatelessWidget {
  const ShareCardBottomSheet({super.key, required this.card});
  final PopulatedCard card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardUrl =
        'https://cardlink.bio/${card.name.replaceAll(' ', '').toLowerCase()}';

    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- Drag Handle ---
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // --- QR Code ---
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: QrImageView(
              data: cardUrl,
              version: QrVersions.auto,
              size: 180.0,
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: theme.colorScheme.primary,
              ),
              dataModuleStyle: QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Point a camera at the QR code to share',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),

          // --- Link and Copy Button ---
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: theme.dividerColor),
            ),
            title: Text(
              cardUrl,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(LucideIcons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: cardUrl));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link copied to clipboard!')),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // --- Share Button ---
          PrimaryButton(
            text: 'Share Profile',
            icon: const Icon(LucideIcons.share2, size: 18),
            onPressed: () {
              Share.share('Check out my CardLink profile: $cardUrl');
            },
          ),
        ],
      ),
    );
  }
}
