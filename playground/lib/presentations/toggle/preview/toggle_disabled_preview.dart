import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/toggle.dart';

/// Preview showing disabled toggles.
class ToggleDisabledPreview extends StatelessWidget {
  const ToggleDisabledPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Toggle(
                value: true,
                label: 'Disabled on',
                disabled: true,
                onChanged: null,
              ),
              SizedBox(height: 16),
              Toggle(
                value: false,
                label: 'Disabled off',
                disabled: true,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

