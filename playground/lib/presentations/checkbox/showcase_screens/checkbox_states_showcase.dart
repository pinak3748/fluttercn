import 'package:flutter/material.dart';

import '../../../widgets/checkbox.dart';
import '../../../config/theme.dart';

class CheckboxStatesShowcase extends StatefulWidget {
  const CheckboxStatesShowcase({super.key});

  @override
  State<CheckboxStatesShowcase> createState() => _CheckboxStatesShowcaseState();
}

class _CheckboxStatesShowcaseState extends State<CheckboxStatesShowcase> {
  bool _checked = true;
  bool _unchecked = false;
  bool? _indeterminate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox States'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Checkbox States',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Three possible states for checkboxes',
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
                  children: [
                    CNCheckbox(
                      value: _checked,
                      label: 'Checked',
                      description: 'This checkbox is checked',
                      onChanged: (value) => setState(() => _checked = value ?? false),
                    ),
                    AppTheme.gapVertical2xl,
                    CNCheckbox(
                      value: _unchecked,
                      label: 'Unchecked',
                      description: 'This checkbox is unchecked',
                      onChanged: (value) => setState(() => _unchecked = value ?? false),
                    ),
                    AppTheme.gapVertical2xl,
                    CNCheckbox(
                      value: _indeterminate,
                      tristate: true,
                      label: 'Indeterminate',
                      description: 'This checkbox is in an indeterminate state',
                      onChanged: (value) => setState(() => _indeterminate = value),
                    ),
                    AppTheme.gapVertical2xl,
                    const CNCheckbox(
                      value: true,
                      disabled: true,
                      label: 'Disabled (Checked)',
                      description: 'This checkbox is disabled',
                      onChanged: null,
                    ),
                    AppTheme.gapVertical2xl,
                    const CNCheckbox(
                      value: false,
                      disabled: true,
                      label: 'Disabled (Unchecked)',
                      onChanged: null,
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
