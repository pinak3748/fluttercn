import 'package:flutter/material.dart';

import '../widgets/badge.dart';
import '../widgets/button.dart';
import '../widgets/avatar.dart';
import '../config/theme.dart';

class BadgeShowcase extends StatefulWidget {
  const BadgeShowcase({super.key});

  @override
  State<BadgeShowcase> createState() => _BadgeShowcaseState();
}

class _BadgeShowcaseState extends State<BadgeShowcase> {
  int _notificationCount = 5;
  final List<String> _tags = ['Design', 'Development', 'Marketing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Badge Variants',
              'Different color schemes for various use cases',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  CNBadge(label: 'Default', variant: BadgeVariant.default_),
                  CNBadge(label: 'Secondary', variant: BadgeVariant.secondary),
                  CNBadge(label: 'Destructive', variant: BadgeVariant.destructive),
                  CNBadge(label: 'Outline', variant: BadgeVariant.outline),
                  CNBadge(label: 'Success', variant: BadgeVariant.success),
                  CNBadge(label: 'Warning', variant: BadgeVariant.warning),
                  CNBadge(label: 'Info', variant: BadgeVariant.info),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Badge Sizes',
              'Badges come in three sizes: small, medium, and large',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  CNBadge(label: 'Small', size: BadgeSize.sm),
                  CNBadge(label: 'Medium', size: BadgeSize.md),
                  CNBadge(label: 'Large', size: BadgeSize.lg),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Badges with Icons',
              'Add icons to provide more context',
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
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Badges with Dot Indicators',
              'Minimal badges with just a dot indicator',
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
            AppTheme.gapVertical3xl,
            _buildSection(
              'Removable Badges',
              'Badges with close button for tags or filters',
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
                      _showSnackBar('Removed: $tag');
                    },
                  );
                }).toList(),
              ),
            ),
            AppTheme.gapVerticalLg,
            Button(
              variant: ButtonVariant.outline,
              size: ButtonSize.sm,
              onPressed: () {
                setState(() {
                  _tags.addAll(['Design', 'Development', 'Marketing']);
                });
              },
              child: const Text('Reset Tags'),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Interactive Badges',
              'Clickable badges for navigation or actions',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  CNBadge(
                    label: 'Click Me',
                    variant: BadgeVariant.default_,
                    onTap: () => _showSnackBar('Badge clicked!'),
                  ),
                  CNBadge(
                    label: 'Category',
                    variant: BadgeVariant.secondary,
                    onTap: () => _showSnackBar('Category badge clicked!'),
                  ),
                  CNBadge(
                    label: 'Filter',
                    variant: BadgeVariant.outline,
                    icon: const Icon(Icons.filter_list),
                    onTap: () => _showSnackBar('Filter clicked!'),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Count Badges',
              'Display counts and notifications',
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
              'Mixed Sizes & Variants',
              'Combining different sizes and variants',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  CNBadge(
                    label: 'New',
                    variant: BadgeVariant.success,
                    size: BadgeSize.sm,
                  ),
                  CNBadge(
                    label: 'Featured',
                    variant: BadgeVariant.info,
                    size: BadgeSize.md,
                    icon: Icon(Icons.star),
                  ),
                  CNBadge(
                    label: 'Premium',
                    variant: BadgeVariant.warning,
                    size: BadgeSize.lg,
                    icon: Icon(Icons.workspace_premium),
                  ),
                  CNBadge(
                    label: 'Beta',
                    variant: BadgeVariant.outline,
                    size: BadgeSize.sm,
                  ),
                  CNBadge(
                    label: 'Deprecated',
                    variant: BadgeVariant.destructive,
                    size: BadgeSize.sm,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Real-world Examples',
              'Common badge use cases in applications',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExample(
                    'User Profile with Status',
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
                                Text('John Doe',
                                    style: TextStyle(fontWeight: FontWeight.w600)),
                                SizedBox(width: 8),
                                CNBadge(
                                  label: 'Pro',
                                  variant: BadgeVariant.info,
                                  size: BadgeSize.sm,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            StatusBadge.online(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Notification Badge',
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Notifications',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        CountBadge(
                          count: _notificationCount,
                          variant: BadgeVariant.destructive,
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
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
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Task Status',
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Complete the design mockups',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            SizedBox(height: 4),
                            Text('Due: Tomorrow',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        CNBadge(
                          label: 'In Progress',
                          variant: BadgeVariant.info,
                          showDot: true,
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'File Type Badges',
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        CNBadge(
                          label: 'PDF',
                          variant: BadgeVariant.destructive,
                          size: BadgeSize.sm,
                          icon: Icon(Icons.picture_as_pdf),
                        ),
                        CNBadge(
                          label: 'DOC',
                          variant: BadgeVariant.info,
                          size: BadgeSize.sm,
                          icon: Icon(Icons.description),
                        ),
                        CNBadge(
                          label: 'IMG',
                          variant: BadgeVariant.success,
                          size: BadgeSize.sm,
                          icon: Icon(Icons.image),
                        ),
                        CNBadge(
                          label: 'ZIP',
                          variant: BadgeVariant.secondary,
                          size: BadgeSize.sm,
                          icon: Icon(Icons.folder_zip),
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Pricing Badges',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Premium Plan',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            CNBadge(
                              label: 'Popular',
                              variant: BadgeVariant.warning,
                              icon: Icon(Icons.trending_up),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('\$29/month',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: const [
                            CNBadge(
                              label: 'Best Value',
                              variant: BadgeVariant.success,
                              size: BadgeSize.sm,
                            ),
                            CNBadge(
                              label: 'Limited Offer',
                              variant: BadgeVariant.destructive,
                              size: BadgeSize.sm,
                            ),
                          ],
                        ),
                      ],
                    ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.headlineSmall.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
        AppTheme.gapVerticalSm,
        Text(
          description,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
        AppTheme.gapVerticalLg,
        content,
      ],
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
