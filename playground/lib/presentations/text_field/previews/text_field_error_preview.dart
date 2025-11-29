import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for text fields with error states.
class TextFieldErrorPreview extends StatefulWidget {
  const TextFieldErrorPreview({super.key});

  @override
  State<TextFieldErrorPreview> createState() => _TextFieldErrorPreviewState();
}

class _TextFieldErrorPreviewState extends State<TextFieldErrorPreview> {
  final TextEditingController _emailController = TextEditingController(
    text: 'invalid-email',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '123',
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                controller: _emailController,
                label: 'Email',
                placeholder: 'john@example.com',
                error: true,
                errorText: 'Please enter a valid email address',
                keyboardType: TextInputType.emailAddress,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _passwordController,
                label: 'Password',
                placeholder: 'Enter your password',
                obscureText: true,
                error: true,
                errorText: 'Password must be at least 8 characters',
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
