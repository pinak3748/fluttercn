import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/toggle.dart';

/// Preview for toggle with description text.
class ToggleDescriptionPreview extends StatefulWidget {
  const ToggleDescriptionPreview({super.key});

  @override
  State<ToggleDescriptionPreview> createState() =>
      _ToggleDescriptionPreviewState();
}

class _ToggleDescriptionPreviewState extends State<ToggleDescriptionPreview> {
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Toggle(
            value: _darkMode,
            label: 'Dark mode',
            description: 'Switch to dark theme for better viewing in low light',
            onChanged: (value) => setState(() => _darkMode = value),
          ),
        ),
      ),
    );
  }
}

