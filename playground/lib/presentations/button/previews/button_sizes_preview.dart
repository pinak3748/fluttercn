import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing all button sizes
/// Run this to take a screenshot for the "Sizes" section
class ButtonSizesPreview extends StatelessWidget {
  const ButtonSizesPreview({super.key});

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
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Small
              Button(
                onPressed: () {},
                size: ButtonSize.sm,
                child: const Text('Small'),
              ),
              // Medium (default)
              Button(
                onPressed: () {},
                size: ButtonSize.md,
                child: const Text('Medium'),
              ),
              // Large
              Button(
                onPressed: () {},
                size: ButtonSize.lg,
                child: const Text('Large'),
              ),
              // Icon only
            ],
          ),
        ),
      ),
    );
  }
}
