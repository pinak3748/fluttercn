import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/avatar_basic_preview.dart';
import 'previews/avatar_group_preview.dart';
import 'previews/avatar_shapes_preview.dart';
import 'previews/avatar_sizes_preview.dart';
import 'previews/avatar_status_preview.dart';
import 'previews/avatar_use_cases_preview.dart';

/// List of avatar preview screens mirroring the documentation sections.
class AvatarPreviewList extends StatelessWidget {
  const AvatarPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Avatar',
            description: 'Network, asset, initials, and custom fallback chain',
            preview: const AvatarBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'xs → 2xl presets (24px – 80px)',
            preview: const AvatarSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Shapes',
            description: 'Circle, rounded rectangle, custom radius',
            preview: const AvatarShapesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Status Indicator',
            description: 'Status colors + four indicator positions',
            preview: const AvatarStatusPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Avatar Group',
            description: 'Overlapping avatars with overflow counter',
            preview: const AvatarGroupPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Examples',
            description: 'Profile header + comment list patterns',
            preview: const AvatarUseCasesPreview(),
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
