import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'preview/accordion_basic_preview.dart';
import 'preview/accordion_custom_preview.dart';
import 'preview/accordion_disabled_preview.dart';
import 'preview/accordion_multiple_preview.dart';
import 'preview/accordion_sizes_preview.dart';
import 'preview/accordion_with_icon_preview.dart';

/// Selector list for all accordion preview screens.
class AccordionPreviewList extends StatelessWidget {
  const AccordionPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accordion Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Accordion',
            description: 'Single expansion accordion',
            preview: const AccordionBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Multiple Expansion',
            description: 'Allow multiple items to be expanded',
            preview: const AccordionMultiplePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Icons',
            description: 'Accordion items with leading icons',
            preview: const AccordionWithIconPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large accordion sizing',
            preview: const AccordionSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled Items',
            description: 'Accordion with disabled items',
            preview: const AccordionDisabledPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Custom Styling',
            description: 'Customized colors and appearance',
            preview: const AccordionCustomPreview(),
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
