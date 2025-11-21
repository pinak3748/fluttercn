import 'package:flutter/material.dart';

import '../../config/theme.dart';

/// Typography preview showing all available text styles from the theme.
/// Displays all typography styles in a single scrollable view.
class TypographyPreviewList extends StatelessWidget {
  const TypographyPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildSection(
            title: 'Display Styles',
            description: 'Large display text for hero sections and landing pages',
            children: [
              _buildTypographyItem(
                label: 'Display Large',
                style: AppTheme.displayLarge,
                sampleText: 'Display Large',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Display Medium',
                style: AppTheme.displayMedium,
                sampleText: 'Display Medium',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Display Small',
                style: AppTheme.displaySmall,
                sampleText: 'Display Small',
              ),
            ],
          ),
          AppTheme.gap2xl,
          _buildSection(
            title: 'Headline Styles',
            description: 'Section headings and prominent titles',
            children: [
              _buildTypographyItem(
                label: 'Headline Large',
                style: AppTheme.headlineLarge,
                sampleText: 'Headline Large',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Headline Medium',
                style: AppTheme.headlineMedium,
                sampleText: 'Headline Medium',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Headline Small',
                style: AppTheme.headlineSmall,
                sampleText: 'Headline Small',
              ),
            ],
          ),
          AppTheme.gap2xl,
          _buildSection(
            title: 'Title Styles',
            description: 'Card titles, labels, and section headers',
            children: [
              _buildTypographyItem(
                label: 'Title Large',
                style: AppTheme.titleLarge,
                sampleText: 'Title Large',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Title Medium',
                style: AppTheme.titleMedium,
                sampleText: 'Title Medium',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Title Small',
                style: AppTheme.titleSmall,
                sampleText: 'Title Small',
              ),
            ],
          ),
          AppTheme.gap2xl,
          _buildSection(
            title: 'Body Styles',
            description: 'Main content text for paragraphs and descriptions',
            children: [
              _buildTypographyItem(
                label: 'Body Large',
                style: AppTheme.bodyLarge,
                sampleText:
                    'Body Large - The quick brown fox jumps over the lazy dog',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Body Medium',
                style: AppTheme.bodyMedium,
                sampleText:
                    'Body Medium - The quick brown fox jumps over the lazy dog',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Body Small',
                style: AppTheme.bodySmall,
                sampleText:
                    'Body Small - The quick brown fox jumps over the lazy dog',
              ),
            ],
          ),
          AppTheme.gap2xl,
          _buildSection(
            title: 'Label Styles',
            description: 'Form labels, captions, and small text',
            children: [
              _buildTypographyItem(
                label: 'Label Large',
                style: AppTheme.labelLarge,
                sampleText: 'Label Large',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Label Medium',
                style: AppTheme.labelMedium,
                sampleText: 'Label Medium',
              ),
              AppTheme.gapMd,
              _buildTypographyItem(
                label: 'Label Small',
                style: AppTheme.labelSmall,
                sampleText: 'Label Small',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.headlineMedium.copyWith(
            color: AppTheme.textPrimary,
          ),
        ),
        AppTheme.gapSm,
        Text(
          description,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        AppTheme.gapLg,
        ...children,
      ],
    );
  }

  Widget _buildTypographyItem({
    required String label,
    required TextStyle style,
    required String sampleText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.labelMedium.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
        AppTheme.gapXs,
        Text(
          sampleText,
          style: style.copyWith(color: AppTheme.textPrimary),
        ),
      ],
    );
  }
}

