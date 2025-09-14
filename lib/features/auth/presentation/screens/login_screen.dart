// lib/features/auth/presentation/screens/login_screen.dart

import 'package:cardlink_ui_kit/core/constants/app_assets.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/custom_text_field.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:cardlink_ui_kit/features/auth/presentation/screens/signup_screen.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/screens/explore_templates_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Header ---
              Icon(
                LucideIcons.link,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome back!',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Log in to manage your digital cards.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),

              // --- Form Fields ---
              const CustomTextField(
                labelText: 'Email',
                hintText: 'you@example.com',
                prefixIcon: LucideIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: LucideIcons.lock,
                obscureText: _isPasswordObscured,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordObscured ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordObscured = !_isPasswordObscured;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              // --- Forgot Password ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(ForgotPasswordScreen.routeName),
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 24),

              // --- Login Button ---
              PrimaryButton(
                text: 'log in',
                onPressed: () {
                  context.push(ExploreTemplatesScreen.routeName);
                },
              ),
              const SizedBox(height: 32),

              // --- Social Login Divider ---
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Or continue with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 32),

              // --- Social Login Button ---
              OutlinedButton.icon(
                icon: SvgPicture.asset(AppAssets.googleIcon, height: 20),
                label: const Text('Continue with Google'),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // --- Signup Link ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push(SignupScreen.routeName),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
