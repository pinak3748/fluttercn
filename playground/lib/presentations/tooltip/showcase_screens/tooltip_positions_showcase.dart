import 'package:flutter/material.dart';

import '../../../widgets/tooltip.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class TooltipPositionsShowcase extends StatelessWidget {
  const TooltipPositionsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Positions'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tooltip Positions',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Tooltips can appear in four positions',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CNTooltip(
                        message: 'Tooltip on top',
                        position: TooltipPosition.top,
                        child: Button(
                          variant: ButtonVariant.outline,
                          onPressed: () {},
                          child: const Text('Top'),
                        ),
                      ),
                      AppTheme.gapVerticalLg,
                      CNTooltip(
                        message: 'Tooltip on bottom',
                        position: TooltipPosition.bottom,
                        child: Button(
                          variant: ButtonVariant.outline,
                          onPressed: () {},
                          child: const Text('Bottom'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 48),
                  Column(
                    children: [
                      CNTooltip(
                        message: 'Tooltip on left',
                        position: TooltipPosition.left,
                        child: Button(
                          variant: ButtonVariant.outline,
                          onPressed: () {},
                          child: const Text('Left'),
                        ),
                      ),
                      AppTheme.gapVerticalLg,
                      CNTooltip(
                        message: 'Tooltip on right',
                        position: TooltipPosition.right,
                        child: Button(
                          variant: ButtonVariant.outline,
                          onPressed: () {},
                          child: const Text('Right'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Container(
                padding: AppTheme.paddingLg,
                decoration: BoxDecoration(
                  color: AppTheme.info.withValues(alpha: 0.1),
                  border: Border.all(color: AppTheme.info.withValues(alpha: 0.3)),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: AppTheme.info, size: 20),
                    AppTheme.gapHorizontalMd,
                    Expanded(
                      child: Text(
                        'Hover over the buttons to see tooltips in different positions',
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
