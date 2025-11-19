import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';

/// Preview for badges that show the dot indicator style.
class BadgeWithDotPreview extends StatelessWidget {
  const BadgeWithDotPreview({super.key});

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
            children: const [
              Badge(
                label: 'Online',
                showDot: true,
                variant: BadgeVariant.success,
              ),
              Badge(
                label: 'Offline',
                showDot: true,
                variant: BadgeVariant.secondary,
              ),
              Badge(
                label: 'Pending',
                showDot: true,
                variant: BadgeVariant.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
