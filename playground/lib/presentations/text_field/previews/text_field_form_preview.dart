import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for a complete form with multiple text fields.
class TextFieldFormPreview extends StatefulWidget {
  const TextFieldFormPreview({super.key});

  @override
  State<TextFieldFormPreview> createState() => _TextFieldFormPreviewState();
}

class _TextFieldFormPreviewState extends State<TextFieldFormPreview> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  bool _emailError = false;
  bool _passwordError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() {
      _emailError = !_emailController.text.contains('@');
      _passwordError =
          _passwordController.text.length < 8 ||
          _passwordController.text != _confirmPasswordController.text;
    });

    if (!_emailError && !_passwordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: AppTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  AppTheme.gapMd,
                  Text(
                    'Fill in the information below to create your account',
                    style: TextStyle(
                      fontSize: AppTheme.fontSizeMd,
                      color: AppTheme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppTheme.gap2xl,
                  cn.TextField(
                    controller: _nameController,
                    label: 'Full name',
                    placeholder: 'John Doe',
                    prefixIcon: Icons.person,
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _emailController,
                    label: 'Email',
                    placeholder: 'john@example.com',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    error: _emailError,
                    errorText: _emailError
                        ? 'Please enter a valid email'
                        : null,
                    onChanged: (_) {
                      if (_emailError) {
                        setState(() => _emailError = false);
                      }
                    },
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _phoneController,
                    label: 'Phone number',
                    description: 'Optional',
                    placeholder: '+1 (555) 123-4567',
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _passwordController,
                    label: 'Password',
                    description: 'Must be at least 8 characters',
                    placeholder: 'Enter your password',
                    obscureText: true,
                    error: _passwordError,
                    onChanged: (_) {
                      if (_passwordError) {
                        setState(() => _passwordError = false);
                      }
                    },
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm password',
                    placeholder: 'Re-enter your password',
                    obscureText: true,
                    error: _passwordError,
                    errorText: _passwordError
                        ? 'Passwords must match and be at least 8 characters'
                        : null,
                    onChanged: (_) {
                      if (_passwordError) {
                        setState(() => _passwordError = false);
                      }
                    },
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _bioController,
                    label: 'Bio',
                    description: 'Tell us a bit about yourself',
                    placeholder: 'Write a short bio...',
                    maxLines: 4,
                  ),
                  AppTheme.gap2xl,
                  Button(
                    onPressed: _validateAndSubmit,
                    fullWidth: true,
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
