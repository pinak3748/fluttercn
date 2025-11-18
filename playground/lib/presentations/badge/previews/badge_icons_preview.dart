import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';
import '../../../widgets/button.dart' show IconPosition;

/// Preview illustrating badges with icons.
class BadgeIconsPreview extends StatelessWidget {
  const BadgeIconsPreview({super.key});

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
                label: 'Verified',
                icon: Icon(Icons.check_circle, size: 14),
                variant: BadgeVariant.success,
              ),
              Badge(
                label: 'External',
                icon: Icon(Icons.open_in_new, size: 14),
                iconPosition: IconPosition.trailing,
              ),
              Badge(
                label: 'Alert',
                icon: Icon(Icons.warning_amber, size: 14),
                variant: BadgeVariant.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
