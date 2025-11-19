import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';
import '../../../widgets/badge.dart';

/// Real-world compositions pulled from the documentation examples.
class BadgeExamplesPreview extends StatelessWidget {
  const BadgeExamplesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: AppTheme.paddingXl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Tags', style: AppTheme.titleLarge),
                      AppTheme.gapSm,
                      Wrap(
                        spacing: AppTheme.spaceSm,
                        runSpacing: AppTheme.spaceSm,
                        children: const [
                          Badge(label: 'Electronics'),
                          Badge(
                            label: 'Sale',
                            variant: BadgeVariant.destructive,
                          ),
                          Badge(label: 'New', variant: BadgeVariant.success),
                          Badge(
                            label: 'Featured',
                            variant: BadgeVariant.warning,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: AppTheme.paddingXl,
                  child: Row(
                    children: [
                      const Avatar(fallbackName: 'John Doe'),
                      AppTheme.gapHorizontalMd,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: AppTheme.titleMedium),
                          const SizedBox(height: 4),
                          const StatusBadge.online(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
