import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/toggle.dart';

/// Preview for a simple toggle without labels.
class ToggleBasicPreview extends StatefulWidget {
  const ToggleBasicPreview({super.key});

  @override
  State<ToggleBasicPreview> createState() => _ToggleBasicPreviewState();
}

class _ToggleBasicPreviewState extends State<ToggleBasicPreview> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppTheme.spaceLg,
            children: [
              Toggle(
                value: _enabled,
                onChanged: (value) => setState(() => _enabled = value),
              ),
              Toggle(
                value: !_enabled,
                onChanged: (value) => setState(() => _enabled = !value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
