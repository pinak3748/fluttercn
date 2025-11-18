import 'package:flutter/material.dart';

import '../../../widgets/tooltip.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class TooltipRealWorldShowcase extends StatelessWidget {
  const TooltipRealWorldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-world Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-world Examples',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Common tooltip use cases',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildExample(
              'Icon Buttons',
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CNTooltip(
                    message: 'Edit',
                    child: Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () {},
                      child: const Icon(Icons.edit),
                    ),
                  ),
                  AppTheme.gapHorizontalMd,
                  CNTooltip(
                    message: 'Delete',
                    child: Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () {},
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  AppTheme.gapHorizontalMd,
                  CNTooltip(
                    message: 'Share',
                    child: Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () {},
                      child: const Icon(Icons.share),
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Help Icons',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Username',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  CNTooltip(
                    message: 'Your unique identifier for login',
                    position: TooltipPosition.left,
                    child: Icon(Icons.help_outline, size: 20, color: AppTheme.textTertiary),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Keyboard Shortcuts',
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CNTooltip(
                    content: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Save'),
                        SizedBox(width: 16),
                        Text('Ctrl+S', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    child: Button(
                      variant: ButtonVariant.outline,
                      icon: const Icon(Icons.save),
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.labelMedium.copyWith(
              color: AppTheme.textTertiary,
              fontWeight: AppTheme.fontWeightMedium,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
