import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/toggle.dart';

/// Preview for toggle with a label.
class ToggleLabelPreview extends StatefulWidget {
  const ToggleLabelPreview({super.key});

  @override
  State<ToggleLabelPreview> createState() => _ToggleLabelPreviewState();
}

class _ToggleLabelPreviewState extends State<ToggleLabelPreview> {
  bool _notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Toggle(
            value: _notifications,
            label: 'Enable notifications',
            onChanged: (value) => setState(() => _notifications = value),
          ),
        ),
      ),
    );
  }
}

