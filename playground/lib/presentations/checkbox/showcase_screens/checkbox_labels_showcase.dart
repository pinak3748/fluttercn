import 'package:flutter/material.dart';

import '../../../widgets/checkbox.dart';
import '../../../config/theme.dart';

class CheckboxLabelsShowcase extends StatefulWidget {
  const CheckboxLabelsShowcase({super.key});

  @override
  State<CheckboxLabelsShowcase> createState() => _CheckboxLabelsShowcaseState();
}

class _CheckboxLabelsShowcaseState extends State<CheckboxLabelsShowcase> {
  bool _withLabel = false;
  bool _withDescription = false;
  bool _withError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Labels'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Checkbox Labels',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Add context with labels and descriptions',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
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
                    'With Labels',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: _withLabel,
                    label: 'I agree to the terms and conditions',
                    onChanged: (value) => setState(() => _withLabel = value ?? false),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
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
                    'With Description',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: _withDescription,
                    label: 'Enable notifications',
                    description: 'Receive email updates about your account activity',
                    onChanged: (value) => setState(() => _withDescription = value ?? false),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
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
                    'Error State',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: _withError,
                    label: 'I accept the license agreement',
                    error: !_withError,
                    errorText: _withError ? null : 'You must accept to continue',
                    onChanged: (value) => setState(() => _withError = value ?? false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
