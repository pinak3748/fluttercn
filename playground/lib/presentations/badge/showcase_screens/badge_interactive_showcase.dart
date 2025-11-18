import 'package:flutter/material.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class BadgeInteractiveShowcase extends StatefulWidget {
  const BadgeInteractiveShowcase({super.key});

  @override
  State<BadgeInteractiveShowcase> createState() => _BadgeInteractiveShowcaseState();
}

class _BadgeInteractiveShowcaseState extends State<BadgeInteractiveShowcase> {
  final List<String> _tags = ['Design', 'Development', 'Marketing', 'Sales'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Badges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Badges',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Clickable and removable badges',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildSection(
              'Clickable Badges',
              'Badges with tap handlers',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  CNBadge(
                    label: 'Click Me',
                    variant: BadgeVariant.default_,
                    onTap: () => _showMessage('Default badge clicked'),
                  ),
                  CNBadge(
                    label: 'Category',
                    variant: BadgeVariant.secondary,
                    onTap: () => _showMessage('Category clicked'),
                  ),
                  CNBadge(
                    label: 'Filter',
                    variant: BadgeVariant.outline,
                    icon: const Icon(Icons.filter_list),
                    onTap: () => _showMessage('Filter clicked'),
                  ),
                  CNBadge(
                    label: 'Action',
                    variant: BadgeVariant.info,
                    icon: const Icon(Icons.touch_app),
                    onTap: () => _showMessage('Action clicked'),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Removable Badges (Tags)',
              'Badges with close button for tags or filters',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: _tags.map((tag) {
                      return CNBadge(
                        label: tag,
                        variant: BadgeVariant.secondary,
                        onRemove: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                          _showMessage('Removed: $tag');
                        },
                      );
                    }).toList(),
                  ),
                  if (_tags.isEmpty) ...[
                    AppTheme.gapVerticalMd,
                    Text(
                      'All tags removed',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                    ),
                  ],
                  AppTheme.gapVerticalLg,
                  Button(
                    variant: ButtonVariant.outline,
                    size: ButtonSize.sm,
                    onPressed: () {
                      setState(() {
                        _tags.addAll(['Design', 'Development', 'Marketing', 'Sales']);
                      });
                    },
                    child: const Text('Reset Tags'),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Dot Indicators',
              'Minimal badges with status dots',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CNBadge(label: 'Online', showDot: true, variant: BadgeVariant.success),
                  CNBadge(label: 'Offline', showDot: true, variant: BadgeVariant.secondary),
                  CNBadge(label: 'Away', showDot: true, variant: BadgeVariant.warning),
                  CNBadge(label: 'Busy', showDot: true, variant: BadgeVariant.destructive),
                  CNBadge(label: 'Available', showDot: true, variant: BadgeVariant.info),
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

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
