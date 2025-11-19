import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing buttons with icons
/// Run this to take a screenshot for the "With Icons" section
class ButtonIconsPreview extends StatelessWidget {
  const ButtonIconsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Leading icon (default)
              Button(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                child: const Text('Email'),
              ),
              AppTheme.gapLg,
              // Trailing icon
              Button(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                iconPosition: IconPosition.trailing,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
