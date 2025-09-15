// lib/features/utilities/presentation/screens/empty_states_gallery_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';

class EmptyStatesGalleryScreen extends StatelessWidget {
  const EmptyStatesGalleryScreen({super.key});
  static const String routeName = '/empty-states-gallery';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Empty States'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'No Data'),
              Tab(text: 'No Internet'),
              Tab(text: 'No Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // --- No Data State ---
            EmptyStateWidget(
              lottieAsset: AppAssets.noData,
              title: 'No Links Yet',
              subtitle:
                  'It looks a bit empty here. Tap the button below to add your first link to your card.',
              actionButton: PrimaryButton(
                onPressed: () {},
                text: 'Add Your First Link',
              ),
            ),

            // --- No Internet State ---
            EmptyStateWidget(
              lottieAsset: AppAssets.noInternet,
              title: 'Connection Lost',
              subtitle:
                  'Please check your internet connection and try again. We couldn\'t connect to our servers.',
              actionButton: PrimaryButton(
                onPressed: () {},
                text: 'Retry Connection',
              ),
            ),

            // --- No Search Results State ---
            const EmptyStateWidget(
              lottieAsset: AppAssets.noResults,
              title: 'No Results Found',
              subtitle:
                  'We couldn\'t find any items matching your search criteria. Please try different keywords.',
              // No action button for this state
            ),
          ],
        ),
      ),
    );
  }
}
