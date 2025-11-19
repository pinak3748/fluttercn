import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing disabled button state
/// Run this to take a screenshot for the "Disabled State" section
class ButtonDisabledPreview extends StatelessWidget {
  const ButtonDisabledPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Button(
            onPressed: () {},
            disabled: true,
            child: const Text('Disabled'),
          ),
        ),
      ),
    );
  }
}
