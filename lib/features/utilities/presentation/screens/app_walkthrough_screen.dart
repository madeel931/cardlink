// lib/features/utilities/presentation/screens/app_walkthrough_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppWalkthroughScreen extends StatefulWidget {
  const AppWalkthroughScreen({super.key});
  static const String routeName = '/app-walkthrough';

  @override
  State<AppWalkthroughScreen> createState() => _AppWalkthroughScreenState();
}

class _AppWalkthroughScreenState extends State<AppWalkthroughScreen> {
  final _pageController = PageController();
  bool _isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- PageView ---
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == 2;
              });
            },
            children: const [
              _WalkthroughPage(
                lottieAsset: AppAssets.onboarding1,
                title: 'Create Your Digital Card',
                description:
                    'Showcase your brand, contact info, and links with a beautifully designed digital business card.',
              ),
              _WalkthroughPage(
                lottieAsset: AppAssets.onboarding2,
                title: 'Add All Your Links',
                description:
                    'Consolidate your social media, websites, and projects into a single, elegant link.',
              ),
              _WalkthroughPage(
                lottieAsset: AppAssets.onboarding3,
                title: 'Track Your Performance',
                description:
                    'Gain insights into your card\'s performance with detailed analytics on views, clicks, and engagement.',
              ),
            ],
          ),

          // --- UI Overlay (Indicator and Buttons) ---
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                // Next/Done Button
                ElevatedButton(
                  onPressed: () {
                    if (_isLastPage) {
                      Navigator.of(context).pop();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_isLastPage ? 'Done' : 'Next'),
                ),
              ],
            ),
          ),

          // --- Close Button ---
          Positioned(
            top: 40,
            right: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for the content of each page
class _WalkthroughPage extends StatelessWidget {
  const _WalkthroughPage({
    required this.lottieAsset,
    required this.title,
    required this.description,
  });

  final String lottieAsset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieAsset,
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
