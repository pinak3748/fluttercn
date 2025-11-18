import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview replicating the documentation's signup form example.
class CheckboxFormPreview extends StatefulWidget {
  const CheckboxFormPreview({super.key});

  @override
  State<CheckboxFormPreview> createState() => _CheckboxFormPreviewState();
}

class _CheckboxFormPreviewState extends State<CheckboxFormPreview> {
  bool _acceptTerms = false;
  bool _attemptedSubmit = false;

  void _handleSubmit() {
    setState(() => _attemptedSubmit = true);
  }

  @override
  Widget build(BuildContext context) {
    final showError = _attemptedSubmit && !_acceptTerms;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Signup Form', style: AppTheme.titleLarge),
              const SizedBox(height: 16),
              cn.Checkbox(
                value: _acceptTerms,
                label: 'I accept the terms and conditions',
                error: showError,
                errorText: showError
                    ? 'You must accept the terms to continue'
                    : null,
                onChanged: (value) =>
                    setState(() => _acceptTerms = value ?? false),
              ),
              const SizedBox(height: 24),
              Button(onPressed: _handleSubmit, child: const Text('Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}
