import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for stepped sliders with divisions.
class SliderStepPreview extends StatefulWidget {
  const SliderStepPreview({super.key});

  @override
  State<SliderStepPreview> createState() => _SliderStepPreviewState();
}

class _SliderStepPreviewState extends State<SliderStepPreview> {
  double _value5 = 50;
  double _value10 = 50;
  double _value20 = 60;

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
                value: _value5,
                divisions: 5,
                label: '5 Steps',
                description: 'Values: 0, 20, 40, 60, 80, 100',
                showValue: true,
                onChanged: (value) => setState(() => _value5 = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _value10,
                divisions: 10,
                label: '10 Steps',
                description: 'Values: 0, 10, 20, ... 100',
                showValue: true,
                activeColor: AppTheme.success,
                onChanged: (value) => setState(() => _value10 = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _value20,
                divisions: 20,
                label: '20 Steps',
                description: 'Fine-grained control with 20 divisions',
                showValue: true,
                activeColor: AppTheme.info,
                onChanged: (value) => setState(() => _value20 = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
