import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/bottom_sheet_basic_preview.dart';
import 'previews/bottom_sheet_detents_preview.dart';
import 'previews/bottom_sheet_form_preview.dart';
import 'previews/bottom_sheet_header_preview.dart';
import 'previews/bottom_sheet_scrollable_preview.dart';
import 'previews/bottom_sheet_use_cases_preview.dart';

/// Selector list for all bottom sheet preview screens.
class BottomSheetPreviewList extends StatelessWidget {
  const BottomSheetPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Bottom Sheet',
            description: 'Simple bottom sheet with basic content',
            preview: const BottomSheetBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Header',
            description:
                'Bottom sheet with title, description, and close button',
            preview: const BottomSheetHeaderPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes (Detents)',
            description: 'Small, medium, large, and full-height bottom sheets',
            preview: const BottomSheetDetentsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Scrollable Content',
            description: 'Bottom sheet with long scrollable content',
            preview: const BottomSheetScrollablePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Form Example',
            description: 'Complete form with input fields and actions',
            preview: const BottomSheetFormPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Use Cases',
            description: 'Real-world examples: share, settings, notifications',
            preview: const BottomSheetUseCasesPreview(),
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
