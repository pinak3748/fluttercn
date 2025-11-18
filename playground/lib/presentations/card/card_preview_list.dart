import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/card_basic_preview.dart';
import 'previews/card_dividers_preview.dart';
import 'previews/card_interactive_preview.dart';
import 'previews/card_profile_preview.dart';

/// Selector widget to navigate to different card previews.
/// Mirrors the documentation sections for consistent screenshots.
class CardPreviewList extends StatelessWidget {
  const CardPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Card',
            description: 'Single-child card content example',
            preview: const CardBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Interactive Card',
            description: 'Card with tap & hover interactions enabled',
            preview: const CardInteractivePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Card with Dividers',
            description: 'Visual separation between sections',
            preview: const CardDividersPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Profile Card',
            description: 'Rich profile example from docs',
            preview: const CardProfilePreview(),
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
