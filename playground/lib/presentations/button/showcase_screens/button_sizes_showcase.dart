import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonSizesShowcase extends StatelessWidget {
  const ButtonSizesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Sizes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button Sizes',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Three standard sizes plus icon-only variant',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 16,
                runSpacing: 24,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Button(
                        size: ButtonSize.sm,
                        onPressed: () => _showMessage(context, 'Small'),
                        child: const Text('Small'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Small (32px)',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        size: ButtonSize.md,
                        onPressed: () => _showMessage(context, 'Medium'),
                        child: const Text('Medium'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Medium (40px)',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        size: ButtonSize.lg,
                        onPressed: () => _showMessage(context, 'Large'),
                        child: const Text('Large'),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Large (48px)',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Button(
                        size: ButtonSize.icon,
                        onPressed: () => _showMessage(context, 'Icon'),
                        child: const Icon(Icons.settings),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Icon (40px)',
                        style: AppTheme.labelSmall.copyWith(
                          color: AppTheme.textTertiary,
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
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size Comparison',
                      style: AppTheme.titleMedium.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalLg,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                          size: ButtonSize.sm,
                          onPressed: () {},
                          child: const Text('Small'),
                        ),
                        Button(
                          size: ButtonSize.md,
                          onPressed: () {},
                          child: const Text('Medium'),
                        ),
                        Button(
                          size: ButtonSize.lg,
                          onPressed: () {},
                          child: const Text('Large'),
                        ),
                      ],
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

  void _showMessage(BuildContext context, String size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$size button pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
