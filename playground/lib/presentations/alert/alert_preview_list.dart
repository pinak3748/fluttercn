import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'preview/alert_basic_preview.dart';
import 'preview/alert_dismissible_preview.dart';
import 'preview/alert_variants_preview.dart';
import 'preview/alert_with_action_preview.dart';
import 'preview/alert_with_icon_preview.dart';

/// Selector list for all alert preview screens.
class AlertPreviewList extends StatelessWidget {
  const AlertPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alert Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Alert',
            description: 'Simple alert with title and description',
            preview: const AlertBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Variants',
            description: 'Info, success, warning, and error styles',
            preview: const AlertVariantsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Alerts with custom leading icons',
            preview: const AlertWithIconPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Actions',
            description: 'Alerts with action buttons',
            preview: const AlertWithActionPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Dismissible',
            description: 'Alerts that can be closed',
            preview: const AlertDismissiblePreview(),
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
