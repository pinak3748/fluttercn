import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/slider.dart';

/// Preview for disabled sliders.
class SliderDisabledPreview extends StatelessWidget {
  const SliderDisabledPreview({super.key});

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
                value: 30,
                disabled: true,
                label: 'Disabled at 30%',
                showValue: true,
                onChanged: (value) {},
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: 75,
                disabled: true,
                label: 'Disabled at 75%',
                description: 'This slider cannot be interacted with',
                showValue: true,
                onChanged: (value) {},
              ),
              AppTheme.gapVertical3xl,
              CNSlider(
                value: 50,
                disabled: true,
                size: CNSliderSize.lg,
                label: 'Large Disabled',
                showValue: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
