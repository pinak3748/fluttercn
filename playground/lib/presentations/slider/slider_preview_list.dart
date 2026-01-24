import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'preview/slider_basic_preview.dart';
import 'preview/slider_disabled_preview.dart';
import 'preview/slider_range_preview.dart';
import 'preview/slider_sizes_preview.dart';
import 'preview/slider_step_preview.dart';
import 'preview/slider_with_label_preview.dart';

/// Selector list for all slider preview screens.
class SliderPreviewList extends StatelessWidget {
  const SliderPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Previews')),
      body: ListView(
        padding: AppTheme.padding2xl,
        children: [
          _buildPreviewCard(
            context,
            title: 'Basic Slider',
            description: 'Simple slider without label',
            preview: const SliderBasicPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'With Label',
            description: 'Slider with label and value display',
            preview: const SliderWithLabelPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Range Slider',
            description: 'Custom min/max range with description',
            preview: const SliderRangePreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Sizes',
            description: 'Small, medium, and large slider sizing',
            preview: const SliderSizesPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Stepped Slider',
            description: 'Discrete steps with divisions',
            preview: const SliderStepPreview(),
          ),
          AppTheme.gapLg,
          _buildPreviewCard(
            context,
            title: 'Disabled State',
            description: 'Examples of disabled sliders',
            preview: const SliderDisabledPreview(),
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
