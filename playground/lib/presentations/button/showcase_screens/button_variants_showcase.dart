import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonVariantsShowcase extends StatelessWidget {
  const ButtonVariantsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Variants'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button Variants',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Different button styles for various use cases',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Button(
                        onPressed: () => _showMessage(context, 'Primary'),
                        child: const Text('Primary'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Primary',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        variant: ButtonVariant.secondary,
                        onPressed: () => _showMessage(context, 'Secondary'),
                        child: const Text('Secondary'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Secondary',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        variant: ButtonVariant.destructive,
                        onPressed: () => _showMessage(context, 'Destructive'),
                        child: const Text('Destructive'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Destructive',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        variant: ButtonVariant.outline,
                        onPressed: () => _showMessage(context, 'Outline'),
                        child: const Text('Outline'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Outline',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        variant: ButtonVariant.ghost,
                        onPressed: () => _showMessage(context, 'Ghost'),
                        child: const Text('Ghost'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Ghost',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        variant: ButtonVariant.link,
                        onPressed: () => _showMessage(context, 'Link'),
                        child: const Text('Link'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Link',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String variant) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$variant button pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
