import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class BadgeRealWorldShowcase extends StatelessWidget {
  const BadgeRealWorldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-world Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-world Examples',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Common badge use cases',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildExample(
              'User Profile with Badge',
              Row(
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'John Doe',
                    showStatus: true,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('John Doe', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(width: 8),
                          CNBadge(label: 'Pro', variant: BadgeVariant.info, size: BadgeSize.sm),
                        ],
                      ),
                      SizedBox(height: 4),
                      StatusBadge.online(),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Notification Badge',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notifications', style: TextStyle(fontWeight: FontWeight.w600)),
                  CountBadge(count: 5, variant: BadgeVariant.destructive),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Product Tags',
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  CNBadge(label: 'Electronics', variant: BadgeVariant.secondary),
                  CNBadge(label: 'Sale', variant: BadgeVariant.destructive),
                  CNBadge(label: 'Free Shipping', variant: BadgeVariant.success),
                  CNBadge(label: 'Limited', variant: BadgeVariant.warning),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Task Status',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Complete design mockups', style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(height: 4),
                        Text('Due: Tomorrow', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  CNBadge(label: 'In Progress', variant: BadgeVariant.info, showDot: true),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'File Types',
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  CNBadge(label: 'PDF', variant: BadgeVariant.destructive, size: BadgeSize.sm, icon: Icon(Icons.picture_as_pdf)),
                  CNBadge(label: 'DOC', variant: BadgeVariant.info, size: BadgeSize.sm, icon: Icon(Icons.description)),
                  CNBadge(label: 'IMG', variant: BadgeVariant.success, size: BadgeSize.sm, icon: Icon(Icons.image)),
                  CNBadge(label: 'ZIP', variant: BadgeVariant.secondary, size: BadgeSize.sm, icon: Icon(Icons.folder_zip)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.labelMedium.copyWith(
              color: AppTheme.textTertiary,
              fontWeight: AppTheme.fontWeightMedium,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
