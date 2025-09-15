// lib/features/utilities/presentation/screens/extra_states_gallery_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/status_screen.dart';
import 'package:flutter/material.dart';

class ExtraStatesGalleryScreen extends StatelessWidget {
  const ExtraStatesGalleryScreen({super.key});
  static const String routeName = '/extra-states-gallery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extra UI States')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStateTile(
            context,
            title: 'Success State',
            onTap: () => _navigateToStatus(
              context,
              StatusScreen(
                lottieAsset: AppAssets.success,
                title: 'Payment Successful!',
                subtitle:
                    'Your subscription is active. You can now explore all premium features.',
                actionButton: PrimaryButton(
                  text: 'Explore Features',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
          _buildStateTile(
            context,
            title: 'Error State',
            onTap: () => _navigateToStatus(
              context,
              StatusScreen(
                lottieAsset: AppAssets.error,
                title: 'Oh No, Something Went Wrong',
                subtitle:
                    'We couldn\'t complete your request. Please check your connection and try again.',
                actionButton: PrimaryButton(
                  text: 'Try Again',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
          _buildStateTile(
            context,
            title: 'Maintenance State',
            onTap: () => _navigateToStatus(
              context,
              StatusScreen(
                lottieAsset: AppAssets.maintenance,
                title: 'Down for Maintenance',
                subtitle:
                    'We are currently improving our services. The app will be back online shortly. Thank you for your patience!',
              ),
            ),
          ),
          _buildStateTile(
            context,
            title: 'Coming Soon State',
            onTap: () => _navigateToStatus(
              context,
              StatusScreen(
                lottieAsset: AppAssets.comingSoon,
                title: 'Feature Coming Soon!',
                subtitle:
                    'We are working hard on this new feature. Stay tuned for updates!',
                actionButton: PrimaryButton(
                  text: 'Got It',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStateTile(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _navigateToStatus(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}
