import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/badge_basic_preview.dart';
import 'previews/badge_examples_preview.dart';
import 'previews/badge_icons_preview.dart';
import 'previews/badge_removable_preview.dart';
import 'previews/badge_sizes_preview.dart';
import 'previews/badge_variants_preview.dart';
import 'previews/badge_with_dot_preview.dart';

/// List view that links out to every badge preview screen.
class BadgePreviewList extends StatelessWidget {
  const BadgePreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Badge',
            description: 'Simple badge showcasing the default style',
            preview: const BadgeBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Variants',
            description: 'All seven badge variants',
            preview: const BadgeVariantsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large badges',
            preview: const BadgeSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Leading and trailing icons for visual cues',
            preview: const BadgeIconsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Dot',
            description: 'Minimal dot indicator style',
            preview: const BadgeWithDotPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Removable Badge',
            description: 'Badges with close / remove actions',
            preview: const BadgeRemovablePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Examples',
            description: 'Product tags and user status patterns',
            preview: const BadgeExamplesPreview(),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewCard(
    BuildContext context, {
    required String title,
    required String description,
    required Widget preview,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => preview));
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Padding(
          padding: AppTheme.paddingLg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppTheme.gapSm,
              Text(
                description,
                style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
