// lib/features/profile/presentation/screens/change_password_screen.dart

import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  static const String routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: const Center(child: Text('Change Password Form')),
    );
  }
}
