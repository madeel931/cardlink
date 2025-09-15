// lib/core/routing/app_router.dart

import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_two.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/login_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_one.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_three.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/signup_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/splash_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/template_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/add_new_card_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/card_customizer_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/card_preview_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/explore_templates_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/template_preview_screen.dart';
import 'package:cardlink_ui_kit/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cardlink_ui_kit/features/link_builder/data/models/link_template_model.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/screens/add_link_screen.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/screens/link_analytics_screen.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/screens/link_templates_screen.dart';
import 'package:cardlink_ui_kit/features/link_builder/presentation/screens/qr_generator_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/confirmation_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/manage_subscription_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/premium_benefits_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/pricing_plans_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/restore_purchases_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/app_info_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/change_password_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/profile_page.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/security_settings_screen.dart';
import 'package:cardlink_ui_kit/features/profile/presentation/screens/theme_switcher_screen.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/component_gallery_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: DashboardScreen.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      // --- NEW ROUTE ---
      GoRoute(
        path: OnboardingScreenOne.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreenOne();
        },
      ),
      GoRoute(
        path: OnboardingScreenTwo.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreenTwo();
        },
      ),
      GoRoute(
        path: OnboardingScreenThree.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreenThree();
        },
      ),
      GoRoute(
        path: LoginScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: SignupScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const SignupScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: OtpVerificationScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          // In a real app, you'd pass the email/phone number here
          // For the UI kit, we'll use a placeholder.
          return const OtpVerificationScreen(
            verificationTarget: 'you@example.com',
          );
        },
      ),
      GoRoute(
        path: DashboardScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardScreen(),
      ),
      GoRoute(
        path: ExploreTemplatesScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ExploreTemplatesScreen(),
      ),
      GoRoute(
        path: TemplatePreviewScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          // Safely cast the 'extra' object to our CardTemplate model.
          final template = state.extra as CardTemplate;
          return TemplatePreviewScreen(template: template);
        },
      ),
      GoRoute(
        path: CardCustomizerScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          final template = state.extra as CardTemplate;
          return CardCustomizerScreen(template: template);
        },
      ),
      GoRoute(
        path: AddNewCardScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const AddNewCardScreen(),
      ),
      GoRoute(
        path: CardPreviewScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          final card = state.extra as PopulatedCard;
          return CardPreviewScreen(card: card);
        },
      ),
      GoRoute(
        path: LinkTemplatesScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const LinkTemplatesScreen(),
      ),
      GoRoute(
        path: AddLinkScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          final template = state.extra as LinkTemplate;
          return AddLinkScreen(template: template);
        },
      ),
      GoRoute(
        path: LinkAnalyticsScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          final link = state.extra as UserLink;
          return LinkAnalyticsScreen(link: link);
        },
      ),
      GoRoute(
        path: QrGeneratorScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const QrGeneratorScreen(),
      ),
      GoRoute(
        path: ProfilePage.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfilePage(),
      ),
      GoRoute(
        path: EditProfileScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfileScreen(),
      ),
      GoRoute(
        path: AccountSettingsScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const AccountSettingsScreen(),
      ),
      GoRoute(
        path: SecuritySettingsScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const SecuritySettingsScreen(),
      ),
      GoRoute(
        path: ChangePasswordScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ChangePasswordScreen(),
      ),
      GoRoute(
        path: ThemeSwitcherScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ThemeSwitcherScreen(),
      ),
      GoRoute(
        path: AppInfoScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const AppInfoScreen(),
      ),
      GoRoute(
        path: PricingPlansScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const PricingPlansScreen(),
      ),
      GoRoute(
        path: PremiumBenefitsScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const PremiumBenefitsScreen(),
      ),
      GoRoute(
        path: ConfirmationScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ConfirmationScreen(),
      ),
      GoRoute(
        path: ManageSubscriptionScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ManageSubscriptionScreen(),
      ),
      GoRoute(
        path: RestorePurchasesScreen.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            const RestorePurchasesScreen(),
      ),
      // .
      GoRoute(
        path: ComponentGalleryScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ComponentGalleryScreen();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.toString()}')),
    ),
  );
}
