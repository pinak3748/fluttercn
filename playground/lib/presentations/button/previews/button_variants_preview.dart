import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing all button variants
/// Run this to take a screenshot for the "Variants" section
class ButtonVariantsPreview extends StatelessWidget {
  const ButtonVariantsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Wrap(
            spacing: AppTheme.spaceMd,
            runSpacing: AppTheme.spaceMd,
            alignment: WrapAlignment.center,
            children: [
              // Primary - Main call-to-action
              Button(onPressed: () {}, child: const Text('Primary')),
              // Secondary - Less prominent actions
              Button(
                onPressed: () {},
                variant: ButtonVariant.secondary,
                child: const Text('Secondary'),
              ),
              // Destructive - Dangerous actions
              Button(
                onPressed: () {},
                variant: ButtonVariant.destructive,
                child: const Text('Destructive'),
              ),
              // Outline - Alternative style
              Button(
                onPressed: () {},
                variant: ButtonVariant.outline,
                child: const Text('Outline'),
              ),
              // Ghost - Minimal style
              Button(
                onPressed: () {},
                variant: ButtonVariant.ghost,
                child: const Text('Ghost'),
              ),
              // Link - Text link style
              Button(
                onPressed: () {},
                variant: ButtonVariant.link,
                child: const Text('Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
