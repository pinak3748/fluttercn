import 'package:flutter/material.dart';

import '../../../widgets/tooltip.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class TooltipTriggersShowcase extends StatelessWidget {
  const TooltipTriggersShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Triggers'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tooltip Triggers',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Different ways to show tooltips',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              _buildExample(
                'Hover (Default)',
                'Tooltip appears on mouse hover',
                CNTooltip(
                  message: 'Appears on hover',
                  trigger: TooltipTrigger.hover,
                  child: Button(
                    variant: ButtonVariant.outline,
                    onPressed: () {},
                    child: const Text('Hover Me'),
                  ),
                ),
              ),
              AppTheme.gapVertical2xl,
              _buildExample(
                'Tap',
                'Tooltip appears on tap/click',
                CNTooltip(
                  message: 'Appears on tap',
                  trigger: TooltipTrigger.tap,
                  child: Button(
                    variant: ButtonVariant.outline,
                    onPressed: () {},
                    child: const Text('Tap Me'),
                  ),
                ),
              ),
              AppTheme.gapVertical2xl,
              _buildExample(
                'Long Press',
                'Tooltip appears on long press',
                CNTooltip(
                  message: 'Appears on long press',
                  trigger: TooltipTrigger.longPress,
                  child: Button(
                    variant: ButtonVariant.outline,
                    onPressed: () {},
                    child: const Text('Long Press Me'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExample(String title, String description, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTheme.titleMedium.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
          AppTheme.gapVerticalXs,
          Text(
            description,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textTertiary,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
