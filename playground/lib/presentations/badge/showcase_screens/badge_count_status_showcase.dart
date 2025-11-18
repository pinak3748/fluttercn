import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class BadgeCountStatusShowcase extends StatefulWidget {
  const BadgeCountStatusShowcase({super.key});

  @override
  State<BadgeCountStatusShowcase> createState() => _BadgeCountStatusShowcaseState();
}

class _BadgeCountStatusShowcaseState extends State<BadgeCountStatusShowcase> {
  int _notificationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count & Status Badges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Count & Status Badges',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Display numbers and statuses',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildSection(
              'Count Badges',
              'Display counts and notifications',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      CountBadge(count: _notificationCount),
                      const CountBadge(count: 3, variant: BadgeVariant.destructive),
                      const CountBadge(count: 150, max: 99, variant: BadgeVariant.info),
                      const CountBadge(count: 0, showZero: true, variant: BadgeVariant.secondary),
                    ],
                  ),
                  AppTheme.gapVerticalLg,
                  Row(
                    children: [
                      Button(
                        variant: ButtonVariant.outline,
                        size: ButtonSize.sm,
                        onPressed: () {
                          setState(() {
                            _notificationCount++;
                          });
                        },
                        child: const Text('Increment'),
                      ),
                      AppTheme.gapHorizontalMd,
                      Button(
                        variant: ButtonVariant.outline,
                        size: ButtonSize.sm,
                        onPressed: () {
                          setState(() {
                            if (_notificationCount > 0) _notificationCount--;
                          });
                        },
                        child: const Text('Decrement'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Status Badges',
              'Predefined status badges for common states',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  StatusBadge.online(),
                  StatusBadge.offline(),
                  StatusBadge.pending(),
                  StatusBadge.active(),
                  StatusBadge.inactive(),
                  StatusBadge.error(),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Count Variants',
              'Count badges in different colors',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CountBadge(count: 5, variant: BadgeVariant.default_),
                  CountBadge(count: 12, variant: BadgeVariant.secondary),
                  CountBadge(count: 99, variant: BadgeVariant.destructive),
                  CountBadge(count: 42, variant: BadgeVariant.success),
                  CountBadge(count: 7, variant: BadgeVariant.warning),
                  CountBadge(count: 23, variant: BadgeVariant.info),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Max Count Limits',
              'Counts with maximum display limits',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CountBadge(count: 50, max: 9, variant: BadgeVariant.destructive),
                  CountBadge(count: 150, max: 99, variant: BadgeVariant.info),
                  CountBadge(count: 1000, max: 999, variant: BadgeVariant.warning),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.titleMedium.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
          AppTheme.gapVerticalXs,
          Text(
            description,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textTertiary,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
