import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for password text fields.
class TextFieldPasswordPreview extends StatefulWidget {
  const TextFieldPasswordPreview({super.key});

  @override
  State<TextFieldPasswordPreview> createState() =>
      _TextFieldPasswordPreviewState();
}

class _TextFieldPasswordPreviewState extends State<TextFieldPasswordPreview> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              cn.TextField(
                controller: _passwordController,
                label: 'Password',
                description: 'Must be at least 8 characters',
                placeholder: 'Enter your password',
                obscureText: true,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _confirmPasswordController,
                label: 'Confirm password',
                placeholder: 'Re-enter your password',
                obscureText: true,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
