import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/button.dart';

/// Preview widget showing button loading state
/// Run this to take a screenshot for the "Loading State" section
class ButtonLoadingPreview extends StatelessWidget {
  const ButtonLoadingPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Button(
            onPressed: () {},
            loading: true,
            child: const Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
