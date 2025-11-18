import 'package:flutter/material.dart';

import '../../../widgets/checkbox.dart';
import '../../../config/theme.dart';

class CheckboxSizesShowcase extends StatefulWidget {
  const CheckboxSizesShowcase({super.key});

  @override
  State<CheckboxSizesShowcase> createState() => _CheckboxSizesShowcaseState();
}

class _CheckboxSizesShowcaseState extends State<CheckboxSizesShowcase> {
  bool _small = true;
  bool _medium = true;
  bool _large = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Sizes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Checkbox Sizes',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Three sizes for different contexts',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Container(
                padding: AppTheme.paddingXl,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CNCheckbox(
                      value: _small,
                      size: CheckboxSize.sm,
                      label: 'Small',
                      description: 'Compact size for dense layouts',
                      onChanged: (value) => setState(() => _small = value ?? false),
                    ),
                    AppTheme.gapVertical3xl,
                    CNCheckbox(
                      value: _medium,
                      size: CheckboxSize.md,
                      label: 'Medium (Default)',
                      description: 'Standard size for most use cases',
                      onChanged: (value) => setState(() => _medium = value ?? false),
                    ),
                    AppTheme.gapVertical3xl,
                    CNCheckbox(
                      value: _large,
                      size: CheckboxSize.lg,
                      label: 'Large',
                      description: 'Larger size for better accessibility',
                      onChanged: (value) => setState(() => _large = value ?? false),
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
