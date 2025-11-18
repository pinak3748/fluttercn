import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;
import '../../../widgets/button.dart';

/// Preview demonstrating validation error state.
class CheckboxErrorPreview extends StatefulWidget {
  const CheckboxErrorPreview({super.key});

  @override
  State<CheckboxErrorPreview> createState() => _CheckboxErrorPreviewState();
}

class _CheckboxErrorPreviewState extends State<CheckboxErrorPreview> {
  bool _acceptTerms = false;
  bool _attempted = false;

  void _handleSubmit() {
    setState(() => _attempted = true);
  }

  @override
  Widget build(BuildContext context) {
    final showError = _attempted && !_acceptTerms;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              cn.Checkbox(
                value: _acceptTerms,
                label: 'I accept the terms and conditions',
                error: showError,
                errorText: showError
                    ? 'You must accept the terms to continue'
                    : null,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value ?? false;
                    if (_attempted && _acceptTerms) {
                      _attempted = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 24),
              Button(onPressed: _handleSubmit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
