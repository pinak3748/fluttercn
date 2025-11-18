import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';

/// Preview showing every badge variant option.
class BadgeVariantsPreview extends StatelessWidget {
  const BadgeVariantsPreview({super.key});

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
            children: const [
              Badge(label: 'Default'),
              Badge(label: 'Secondary', variant: BadgeVariant.secondary),
              Badge(label: 'Destructive', variant: BadgeVariant.destructive),
              Badge(label: 'Outline', variant: BadgeVariant.outline),
              Badge(label: 'Success', variant: BadgeVariant.success),
              Badge(label: 'Warning', variant: BadgeVariant.warning),
              Badge(label: 'Info', variant: BadgeVariant.info),
            ],
          ),
        ),
      ),
    );
  }
}
