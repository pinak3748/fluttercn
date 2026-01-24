import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for the three slider sizes.
class SliderSizesPreview extends StatefulWidget {
  const SliderSizesPreview({super.key});

  @override
  State<SliderSizesPreview> createState() => _SliderSizesPreviewState();
}

class _SliderSizesPreviewState extends State<SliderSizesPreview> {
  final Map<CNSliderSize, double> _values = {
    CNSliderSize.sm: 30,
    CNSliderSize.md: 50,
    CNSliderSize.lg: 70,
  };

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
                value: _values[CNSliderSize.sm]!,
                size: CNSliderSize.sm,
                label: 'Small',
                showValue: true,
                onChanged: (value) =>
                    setState(() => _values[CNSliderSize.sm] = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _values[CNSliderSize.md]!,
                size: CNSliderSize.md,
                label: 'Medium (Default)',
                showValue: true,
                onChanged: (value) =>
                    setState(() => _values[CNSliderSize.md] = value),
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: _values[CNSliderSize.lg]!,
                size: CNSliderSize.lg,
                label: 'Large',
                showValue: true,
                onChanged: (value) =>
                    setState(() => _values[CNSliderSize.lg] = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
