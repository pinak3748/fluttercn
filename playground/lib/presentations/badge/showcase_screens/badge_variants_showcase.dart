import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../config/theme.dart';

class BadgeVariantsShowcase extends StatelessWidget {
  const BadgeVariantsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Variants'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Badge Variants',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Different color schemes for various use cases',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 12,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      const CNBadge(label: 'Default', variant: BadgeVariant.default_),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Default',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Secondary', variant: BadgeVariant.secondary),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Secondary',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Destructive', variant: BadgeVariant.destructive),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Destructive',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Outline', variant: BadgeVariant.outline),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Outline',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Success', variant: BadgeVariant.success),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Success',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Warning', variant: BadgeVariant.warning),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Warning',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Info', variant: BadgeVariant.info),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Info',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Container(
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
                      'Usage Examples',
                      style: AppTheme.titleMedium.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalMd,
                    _buildUsageRow('Default', 'Primary actions, highlights'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Secondary', 'Neutral information, tags'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Destructive', 'Errors, critical alerts'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Outline', 'Subtle emphasis, filters'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Success', 'Completed tasks, positive status'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Warning', 'Cautions, pending items'),
                    AppTheme.gapVerticalSm,
                    _buildUsageRow('Info', 'Informational messages'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsageRow(String variant, String usage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            variant,
            style: AppTheme.labelSmall.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
        ),
        AppTheme.gapHorizontalMd,
        Expanded(
          child: Text(
            usage,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
