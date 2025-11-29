import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'preview/toggle_basic_preview.dart';
import 'preview/toggle_description_preview.dart';
import 'preview/toggle_disabled_preview.dart';
import 'preview/toggle_error_preview.dart';
import 'preview/toggle_label_preview.dart';
import 'preview/toggle_sizes_preview.dart';

/// Selector list for all toggle preview screens.
class TogglePreviewList extends StatelessWidget {
  const TogglePreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Toggle',
            description: 'Single toggle without label',
            preview: const ToggleBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Label',
            description: 'Toggle paired with a descriptive label',
            preview: const ToggleLabelPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Description',
            description: 'Label + supporting description text',
            preview: const ToggleDescriptionPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large toggle sizing',
            preview: const ToggleSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Examples of disabled toggles',
            preview: const ToggleDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Error State',
            description: 'Toggle showing validation feedback',
            preview: const ToggleErrorPreview(),
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
