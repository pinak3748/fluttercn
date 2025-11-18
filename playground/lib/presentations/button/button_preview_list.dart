import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/button_disabled_preview.dart';
import 'previews/button_full_width_preview.dart';
import 'previews/button_icons_preview.dart';
import 'previews/button_loading_preview.dart';
import 'previews/button_sizes_preview.dart';
import 'previews/button_variants_preview.dart';

/// List of button preview screens. Each card navigates to a focused preview.
class ButtonPreviewList extends StatelessWidget {
  const ButtonPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Variants',
            description:
                'Primary, secondary, destructive, outline, ghost, link',
            preview: const ButtonVariantsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'sm, md, lg, and icon sizes',
            preview: const ButtonSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Leading, trailing, and icon-only buttons',
            preview: const ButtonIconsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Loading State',
            description: 'Shows built-in loading indicator',
            preview: const ButtonLoadingPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Demonstrates disabled styling',
            preview: const ButtonDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Full Width',
            description: 'Edge-to-edge layout',
            preview: const ButtonFullWidthPreview(),
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
