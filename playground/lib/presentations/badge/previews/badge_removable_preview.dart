import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';

/// Preview showcasing badges with remove buttons.
class BadgeRemovablePreview extends StatelessWidget {
  const BadgeRemovablePreview({super.key});

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
              Badge(
                label: 'Tag Name',
                variant: BadgeVariant.secondary,
                onRemove: () {},
              ),
              Badge(
                label: 'Filter: Active',
                variant: BadgeVariant.success,
                onRemove: () {},
              ),
              Badge(
                label: 'Warning',
                variant: BadgeVariant.warning,
                onRemove: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
