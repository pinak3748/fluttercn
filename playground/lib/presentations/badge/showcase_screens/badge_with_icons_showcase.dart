import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/button.dart' show IconPosition;
import '../../../config/theme.dart';

class BadgeWithIconsShowcase extends StatelessWidget {
  const BadgeWithIconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges with Icons'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Badges with Icons',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Add icons to provide more context',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildSection(
              'Leading Icons',
              'Icons positioned before the text',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CNBadge(
                    label: 'Verified',
                    variant: BadgeVariant.success,
                    icon: Icon(Icons.check_circle),
                  ),
                  CNBadge(
                    label: 'Alert',
                    variant: BadgeVariant.warning,
                    icon: Icon(Icons.warning),
                  ),
                  CNBadge(
                    label: 'Error',
                    variant: BadgeVariant.destructive,
                    icon: Icon(Icons.error),
                  ),
                  CNBadge(
                    label: 'Info',
                    variant: BadgeVariant.info,
                    icon: Icon(Icons.info),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Trailing Icons',
              'Icons positioned after the text',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CNBadge(
                    label: 'Star',
                    icon: Icon(Icons.star),
                    iconPosition: IconPosition.trailing,
                  ),
                  CNBadge(
                    label: 'Download',
                    variant: BadgeVariant.secondary,
                    icon: Icon(Icons.download),
                    iconPosition: IconPosition.trailing,
                  ),
                  CNBadge(
                    label: 'Upload',
                    variant: BadgeVariant.info,
                    icon: Icon(Icons.upload),
                    iconPosition: IconPosition.trailing,
                  ),
                  CNBadge(
                    label: 'Share',
                    variant: BadgeVariant.outline,
                    icon: Icon(Icons.share),
                    iconPosition: IconPosition.trailing,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Different Sizes with Icons',
              'Icons scale appropriately with badge size',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      CNBadge(
                        label: 'Small',
                        variant: BadgeVariant.success,
                        size: BadgeSize.sm,
                        icon: Icon(Icons.check),
                      ),
                      CNBadge(
                        label: 'Medium',
                        variant: BadgeVariant.success,
                        size: BadgeSize.md,
                        icon: Icon(Icons.check),
                      ),
                      CNBadge(
                        label: 'Large',
                        variant: BadgeVariant.success,
                        size: BadgeSize.lg,
                        icon: Icon(Icons.check),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Status Icons',
              'Common status indicators',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CNBadge(
                    label: 'Active',
                    variant: BadgeVariant.success,
                    icon: Icon(Icons.play_arrow),
                    showDot: true,
                  ),
                  CNBadge(
                    label: 'Paused',
                    variant: BadgeVariant.warning,
                    icon: Icon(Icons.pause),
                    showDot: true,
                  ),
                  CNBadge(
                    label: 'Stopped',
                    variant: BadgeVariant.destructive,
                    icon: Icon(Icons.stop),
                    showDot: true,
                  ),
                  CNBadge(
                    label: 'Pending',
                    variant: BadgeVariant.secondary,
                    icon: Icon(Icons.schedule),
                    showDot: true,
                  ),
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
