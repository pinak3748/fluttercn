import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview for checkbox with description text.
class CheckboxDescriptionPreview extends StatefulWidget {
  const CheckboxDescriptionPreview({super.key});

  @override
  State<CheckboxDescriptionPreview> createState() =>
      _CheckboxDescriptionPreviewState();
}

class _CheckboxDescriptionPreviewState
    extends State<CheckboxDescriptionPreview> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: cn.Checkbox(
            value: _notifications,
            label: 'Enable notifications',
            description: 'Receive email updates about your account activity',
            onChanged: (value) =>
                setState(() => _notifications = value ?? false),
          ),
        ),
      ),
    );
  }
}
