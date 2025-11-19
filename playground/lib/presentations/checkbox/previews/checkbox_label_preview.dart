import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview for checkbox with a label.
class CheckboxLabelPreview extends StatefulWidget {
  const CheckboxLabelPreview({super.key});

  @override
  State<CheckboxLabelPreview> createState() => _CheckboxLabelPreviewState();
}

class _CheckboxLabelPreviewState extends State<CheckboxLabelPreview> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: cn.Checkbox(
            value: _acceptTerms,
            label: 'Accept terms and conditions',
            onChanged: (value) => setState(() => _acceptTerms = value ?? false),
          ),
        ),
      ),
    );
  }
}
