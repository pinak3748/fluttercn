import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview for a simple checkbox without labels.
class CheckboxBasicPreview extends StatefulWidget {
  const CheckboxBasicPreview({super.key});

  @override
  State<CheckboxBasicPreview> createState() => _CheckboxBasicPreviewState();
}

class _CheckboxBasicPreviewState extends State<CheckboxBasicPreview> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: cn.Checkbox(
            value: _checked,
            onChanged: (value) => setState(() => _checked = value ?? false),
          ),
        ),
      ),
    );
  }
}
