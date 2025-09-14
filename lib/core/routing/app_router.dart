// lib/core/routing/app_router.dart

import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_two.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/login_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_one.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/onboarding_screen_three.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/signup_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/splash_screen.dart';
import 'package:cardlink_ui_kit/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cardlink_ui_kit/features/utilities/presentation/screens/component_gallery_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: SplashScreen.routeName,
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
