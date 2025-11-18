import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonAnimationsShowcase extends StatelessWidget {
  const ButtonAnimationsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Animations'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button Animations',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Interactive press and hover effects',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Container(
                width: double.infinity,
                padding: AppTheme.paddingXl,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Column(
                  children: [
                    Text(
                      'Press Animation',
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      'All buttons scale down slightly when pressed for tactile feedback',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppTheme.gapVertical2xl,
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        Button(
                          onPressed: () => _showMessage(context, 'Primary'),
                          child: const Text('Press Me'),
                        ),
                        Button(
                          variant: ButtonVariant.secondary,
                          onPressed: () => _showMessage(context, 'Secondary'),
                          child: const Text('Press Me'),
                        ),
                        Button(
                          variant: ButtonVariant.outline,
                          onPressed: () => _showMessage(context, 'Outline'),
                          child: const Text('Press Me'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppTheme.gapVertical3xl,
              Container(
                width: double.infinity,
                padding: AppTheme.paddingXl,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Column(
                  children: [
                    Text(
                      'Hover Effects',
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      'Cursor changes and ripple effects provide visual feedback',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppTheme.gapVertical2xl,
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        Button(
                          variant: ButtonVariant.primary,
                          onPressed: () => _showMessage(context, 'Hover 1'),
                          icon: const Icon(Icons.mouse),
                          child: const Text('Hover Over Me'),
                        ),
                        Button(
                          variant: ButtonVariant.ghost,
                          onPressed: () => _showMessage(context, 'Hover 2'),
                          icon: const Icon(Icons.touch_app),
                          child: const Text('Hover Over Me'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppTheme.gapVertical3xl,
              Container(
                width: double.infinity,
                padding: AppTheme.paddingXl,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Column(
                  children: [
                    Text(
                      'Transition Effects',
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      'Smooth color transitions and state changes',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppTheme.gapVertical2xl,
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: ButtonVariant.values.map((variant) {
                        return Button(
                          variant: variant,
                          onPressed: () => _showMessage(context, variant.name),
                          child: Text(variant.name.toUpperCase()[0] + variant.name.substring(1)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
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
                        'Try pressing and holding the buttons to see the scale animation in action',
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

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action button pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
