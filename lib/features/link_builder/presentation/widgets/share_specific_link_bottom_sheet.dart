// lib/features/link_builder/presentation/widgets/share_specific_link_bottom_sheet.dart

import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ShareSpecificLinkBottomSheet extends StatelessWidget {
  const ShareSpecificLinkBottomSheet({super.key, required this.link});
  final UserLink link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkUrl = link.url;

    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 30,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(
              link.icon,
              size: 28,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Share ${link.title}',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(LucideIcons.copy),
            title: const Text('Copy URL'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Clipboard.setData(ClipboardData(text: linkUrl));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link URL copied to clipboard!')),
              );
            },
          ),
          ListTile(
            leading: const Icon(LucideIcons.share2),
            title: const Text('Share Link...'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Share.share('Check out my ${link.title} profile: $linkUrl');
            },
          ),
          ListTile(
            leading: const Icon(LucideIcons.qrCode),
            title: const Text('Show QR Code'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet first
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  // --- THIS IS THE FIX ---
                  // Wrap the QrImageView in a SizedBox to give it a fixed size.
                  contentPadding: const EdgeInsets.all(12.0),
                  content: SizedBox(
                    width: 250,
                    height: 250,
                    child: QrImageView(
                      data: linkUrl,
                      version: QrVersions.auto,
                      padding: EdgeInsets.zero, // Remove default padding
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
