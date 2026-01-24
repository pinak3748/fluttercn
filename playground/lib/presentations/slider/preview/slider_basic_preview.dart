import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for a simple slider without labels.
class SliderBasicPreview extends StatefulWidget {
  const SliderBasicPreview({super.key});

  @override
  State<SliderBasicPreview> createState() => _SliderBasicPreviewState();
}

class _SliderBasicPreviewState extends State<SliderBasicPreview> {
  double _value1 = 50;
  double _value2 = 25;

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
                value: _value1,
                onChanged: (value) => setState(() => _value1 = value),
              ),
              AppTheme.gapVertical2xl,
              CNSlider(
                value: _value2,
                onChanged: (value) => setState(() => _value2 = value),
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Slider 1: ${_value1.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapSm,
              Text(
                'Slider 2: ${_value2.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
