import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'previews/text_field_basic_preview.dart';
import 'previews/text_field_description_preview.dart';
import 'previews/text_field_disabled_preview.dart';
import 'previews/text_field_error_preview.dart';
import 'previews/text_field_form_preview.dart';
import 'previews/text_field_icons_preview.dart';
import 'previews/text_field_label_preview.dart';
import 'previews/text_field_multiline_preview.dart';
import 'previews/text_field_password_preview.dart';
import 'previews/text_field_sizes_preview.dart';

/// Selector list for all text field preview screens.
class TextFieldPreviewList extends StatelessWidget {
  const TextFieldPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic TextField',
            description: 'Simple text field with placeholder',
            preview: const TextFieldBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Label',
            description: 'Text field paired with a descriptive label',
            preview: const TextFieldLabelPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Description',
            description: 'Label + supporting description text',
            preview: const TextFieldDescriptionPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Text fields with prefix and suffix icons',
            preview: const TextFieldIconsPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Password Field',
            description: 'Obscured text input with visibility toggle',
            preview: const TextFieldPasswordPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Multiline',
            description: 'Textarea for longer text input',
            preview: const TextFieldMultilinePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large text field sizing',
            preview: const TextFieldSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Examples of disabled text fields',
            preview: const TextFieldDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Error State',
            description: 'Text field showing validation feedback',
            preview: const TextFieldErrorPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Form Example',
            description: 'Complete form with multiple text fields',
            preview: const TextFieldFormPreview(),
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
