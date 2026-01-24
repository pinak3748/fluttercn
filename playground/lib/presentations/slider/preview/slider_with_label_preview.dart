import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for sliders with labels and descriptions.
class SliderWithLabelPreview extends StatefulWidget {
  const SliderWithLabelPreview({super.key});

  @override
  State<SliderWithLabelPreview> createState() => _SliderWithLabelPreviewState();
}

class _SliderWithLabelPreviewState extends State<SliderWithLabelPreview> {
  double _volume = 75;
  double _brightness = 50;
  double _opacity = 100;

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
                value: _volume,
                label: 'Volume',
                showValue: true,
                onChanged: (value) => setState(() => _volume = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _brightness,
                label: 'Brightness',
                description: 'Adjust screen brightness level',
                showValue: true,
                onChanged: (value) => setState(() => _brightness = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _opacity,
                label: 'Opacity',
                description: 'Control the transparency of the element',
                showValue: true,
                activeColor: AppTheme.info,
                onChanged: (value) => setState(() => _opacity = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
