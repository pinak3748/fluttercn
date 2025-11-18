import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../config/theme.dart';

class BadgeSizesShowcase extends StatelessWidget {
  const BadgeSizesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Sizes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Badge Sizes',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Three sizes for different contexts',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 16,
                runSpacing: 24,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      const CNBadge(label: 'Small', size: BadgeSize.sm),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Small',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Medium', size: BadgeSize.md),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Medium (Default)',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CNBadge(label: 'Large', size: BadgeSize.lg),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Large',
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
                      'All Variants in Different Sizes',
                      style: AppTheme.titleMedium.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalLg,
                    _buildSizeComparison('Small', BadgeSize.sm),
                    AppTheme.gapVerticalLg,
                    _buildSizeComparison('Medium', BadgeSize.md),
                    AppTheme.gapVerticalLg,
                    _buildSizeComparison('Large', BadgeSize.lg),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeComparison(String label, BadgeSize size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.labelSmall.copyWith(
            color: AppTheme.textTertiary,
            fontWeight: AppTheme.fontWeightMedium,
          ),
        ),
        AppTheme.gapVerticalSm,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CNBadge(label: 'Default', variant: BadgeVariant.default_, size: size),
            CNBadge(label: 'Success', variant: BadgeVariant.success, size: size),
            CNBadge(label: 'Warning', variant: BadgeVariant.warning, size: size),
            CNBadge(label: 'Info', variant: BadgeVariant.info, size: size),
          ],
        ),
      ],
    );
  }
}
