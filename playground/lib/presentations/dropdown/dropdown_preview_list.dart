import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/dropdown_basic_preview.dart';
import 'previews/dropdown_description_preview.dart';
import 'previews/dropdown_disabled_preview.dart';
import 'previews/dropdown_error_preview.dart';
import 'previews/dropdown_form_preview.dart';
import 'previews/dropdown_icons_preview.dart';
import 'previews/dropdown_label_preview.dart';
import 'previews/dropdown_sizes_preview.dart';

/// Selector list for all dropdown preview screens.
class DropdownPreviewList extends StatelessWidget {
  const DropdownPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Dropdown',
            description: 'Simple dropdown with basic options',
            preview: const DropdownBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Label',
            description: 'Dropdown paired with a descriptive label',
            preview: const DropdownLabelPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Description',
            description: 'Label + supporting description text',
            preview: const DropdownDescriptionPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Dropdown items with leading icons',
            preview: const DropdownIconsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large dropdown sizing',
            preview: const DropdownSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Examples of disabled dropdowns',
            preview: const DropdownDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Error State',
            description: 'Dropdown showing validation feedback',
            preview: const DropdownErrorPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Form Example',
            description: 'Complete form with multiple dropdowns',
            preview: const DropdownFormPreview(),
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
