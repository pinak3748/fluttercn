import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing full width button
/// Run this to take a screenshot for the "Full Width" section
class ButtonFullWidthPreview extends StatelessWidget {
  const ButtonFullWidthPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: SizedBox(
            width: 400, // Constrain width to show full width effect
            child: Button(
              onPressed: () {},
              fullWidth: true,
              child: const Text('Full Width Button'),
            ),
          ),
        ),
      ),
    );
  }
}
