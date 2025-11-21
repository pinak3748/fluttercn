import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/checkbox_basic_preview.dart';
import 'previews/checkbox_description_preview.dart';
import 'previews/checkbox_disabled_preview.dart';
import 'previews/checkbox_error_preview.dart';
import 'previews/checkbox_form_preview.dart';
import 'previews/checkbox_group_preview.dart';
import 'previews/checkbox_label_preview.dart';
import 'previews/checkbox_sizes_preview.dart';

/// Selector list for all checkbox preview screens.
class CheckboxPreviewList extends StatelessWidget {
  const CheckboxPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Checkbox',
            description: 'Single checkbox without label',
            preview: const CheckboxBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Label',
            description: 'Checkbox paired with a descriptive label',
            preview: const CheckboxLabelPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Description',
            description: 'Label + supporting description text',
            preview: const CheckboxDescriptionPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large checkbox sizing',
            preview: const CheckboxSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Examples of disabled checkboxes',
            preview: const CheckboxDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Error State',
            description: 'Checkbox showing validation feedback',
            preview: const CheckboxErrorPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Checkbox Group',
            description: 'Manage multiple related options',
            preview: const CheckboxGroupPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Form Example',
            description: 'Signup form snippet with validation',
            preview: const CheckboxFormPreview(),
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
