import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';

/// Preview showing the three badge sizes.
class BadgeSizesPreview extends StatelessWidget {
  const BadgeSizesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Wrap(
            spacing: AppTheme.spaceLg,
            runSpacing: AppTheme.spaceLg,
            alignment: WrapAlignment.center,
            children: [
              _buildColumn(
                'Small',
                const Badge(label: 'Small', size: BadgeSize.sm),
              ),
              _buildColumn(
                'Medium',
                const Badge(label: 'Medium', size: BadgeSize.md),
              ),
              _buildColumn(
                'Large',
                const Badge(label: 'Large', size: BadgeSize.lg),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(String label, Widget badge) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [badge, const SizedBox(height: 8), Text(label)],
    );
  }
}
