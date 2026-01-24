import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for sliders with custom ranges.
class SliderRangePreview extends StatefulWidget {
  const SliderRangePreview({super.key});

  @override
  State<SliderRangePreview> createState() => _SliderRangePreviewState();
}

class _SliderRangePreviewState extends State<SliderRangePreview> {
  double _temperature = 22;
  double _percentage = 0.5;
  double _price = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CNSlider(
                value: _temperature,
                min: 16,
                max: 30,
                label: 'Temperature',
                description: 'Set room temperature (16-30 C)',
                showValue: true,
                onChanged: (value) => setState(() => _temperature = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _percentage,
                min: 0,
                max: 1,
                label: 'Percentage',
                description: 'Value between 0 and 1',
                showValue: true,
                activeColor: AppTheme.success,
                onChanged: (value) => setState(() => _percentage = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _price,
                min: 0,
                max: 1000,
                label: 'Price Range',
                description: 'Filter by maximum price',
                showValue: true,
                activeColor: AppTheme.warning,
                onChanged: (value) => setState(() => _price = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
