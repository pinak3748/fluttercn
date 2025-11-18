import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonCombinationsShowcase extends StatelessWidget {
  const ButtonCombinationsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Combinations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Button Combinations',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Creative combinations of different button properties',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildSection(
              'Small Destructive Actions',
              [
                Button(
                  variant: ButtonVariant.destructive,
                  size: ButtonSize.sm,
                  icon: const Icon(Icons.delete),
                  onPressed: () => _showMessage(context, 'Delete'),
                  child: const Text('Delete'),
                ),
                Button(
                  variant: ButtonVariant.destructive,
                  size: ButtonSize.sm,
                  icon: const Icon(Icons.close),
                  onPressed: () => _showMessage(context, 'Remove'),
                  child: const Text('Remove'),
                ),
                Button(
                  variant: ButtonVariant.destructive,
                  size: ButtonSize.sm,
                  icon: const Icon(Icons.clear),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'Clear'),
                  child: const Text('Clear All'),
                ),
              ],
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Large Primary Actions',
              [
                Button(
                  size: ButtonSize.lg,
                  icon: const Icon(Icons.login),
                  onPressed: () => _showMessage(context, 'Sign In'),
                  child: const Text('Sign In'),
                ),
                Button(
                  size: ButtonSize.lg,
                  icon: const Icon(Icons.person_add),
                  onPressed: () => _showMessage(context, 'Create Account'),
                  child: const Text('Create Account'),
                ),
                Button(
                  size: ButtonSize.lg,
                  icon: const Icon(Icons.arrow_forward),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'Get Started'),
                  child: const Text('Get Started'),
                ),
              ],
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Ghost Buttons with Icons',
              [
                Button(
                  variant: ButtonVariant.ghost,
                  icon: const Icon(Icons.download),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'Download'),
                  child: const Text('Download'),
                ),
                Button(
                  variant: ButtonVariant.ghost,
                  icon: const Icon(Icons.share),
                  onPressed: () => _showMessage(context, 'Share'),
                  child: const Text('Share'),
                ),
                Button(
                  variant: ButtonVariant.ghost,
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () => _showMessage(context, 'Bookmark'),
                  child: const Text('Bookmark'),
                ),
              ],
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Outline with Different Sizes',
              [
                Button(
                  variant: ButtonVariant.outline,
                  size: ButtonSize.sm,
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _showMessage(context, 'Filter'),
                  child: const Text('Filter'),
                ),
                Button(
                  variant: ButtonVariant.outline,
                  size: ButtonSize.md,
                  icon: const Icon(Icons.sort),
                  onPressed: () => _showMessage(context, 'Sort'),
                  child: const Text('Sort'),
                ),
                Button(
                  variant: ButtonVariant.outline,
                  size: ButtonSize.lg,
                  icon: const Icon(Icons.tune),
                  onPressed: () => _showMessage(context, 'Settings'),
                  child: const Text('Settings'),
                ),
              ],
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Secondary with Trailing Icons',
              [
                Button(
                  variant: ButtonVariant.secondary,
                  icon: const Icon(Icons.chevron_right),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'Next'),
                  child: const Text('Next'),
                ),
                Button(
                  variant: ButtonVariant.secondary,
                  icon: const Icon(Icons.open_in_new),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'View More'),
                  child: const Text('View More'),
                ),
                Button(
                  variant: ButtonVariant.secondary,
                  icon: const Icon(Icons.arrow_upward),
                  iconPosition: IconPosition.trailing,
                  onPressed: () => _showMessage(context, 'Export'),
                  child: const Text('Export'),
                ),
              ],
            ),
            AppTheme.gapVertical3xl,
            Container(
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
                    'Icon-only Button Group',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalMd,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Bold'),
                        child: const Icon(Icons.format_bold),
                      ),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Italic'),
                        child: const Icon(Icons.format_italic),
                      ),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Underline'),
                        child: const Icon(Icons.format_underlined),
                      ),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Strikethrough'),
                        child: const Icon(Icons.strikethrough_s),
                      ),
                      const SizedBox(width: 8),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Align Left'),
                        child: const Icon(Icons.format_align_left),
                      ),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Align Center'),
                        child: const Icon(Icons.format_align_center),
                      ),
                      Button(
                        size: ButtonSize.icon,
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Align Right'),
                        child: const Icon(Icons.format_align_right),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> buttons) {
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
          AppTheme.gapVerticalMd,
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: buttons,
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
