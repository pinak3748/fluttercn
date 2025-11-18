import 'package:flutter/material.dart';

import '../../../widgets/checkbox.dart';
import '../../../config/theme.dart';

class CheckboxRealWorldShowcase extends StatefulWidget {
  const CheckboxRealWorldShowcase({super.key});

  @override
  State<CheckboxRealWorldShowcase> createState() => _CheckboxRealWorldShowcaseState();
}

class _CheckboxRealWorldShowcaseState extends State<CheckboxRealWorldShowcase> {
  bool _remember = false;
  bool _marketing = false;
  bool _updates = true;
  bool? _selectAll;
  bool _item1 = false;
  bool _item2 = true;
  bool _item3 = false;

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
              'Common checkbox use cases',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildExample(
              'Login Form',
              CNCheckbox(
                value: _remember,
                label: 'Remember me',
                size: CheckboxSize.sm,
                onChanged: (value) => setState(() => _remember = value ?? false),
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Settings',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: _marketing,
                    label: 'Marketing emails',
                    description: 'Receive promotional offers and updates',
                    onChanged: (value) => setState(() => _marketing = value ?? false),
                  ),
                  AppTheme.gapVerticalLg,
                  CNCheckbox(
                    value: _updates,
                    label: 'Product updates',
                    description: 'Get notified about new features',
                    onChanged: (value) => setState(() => _updates = value ?? false),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Select All',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: _selectAll,
                    tristate: true,
                    label: 'Select All',
                    onChanged: (value) {
                      setState(() {
                        _selectAll = value;
                        if (value != null) {
                          _item1 = value;
                          _item2 = value;
                          _item3 = value;
                        }
                      });
                    },
                  ),
                  AppTheme.gapVerticalMd,
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Column(
                      children: [
                        CNCheckbox(
                          value: _item1,
                          label: 'Item 1',
                          size: CheckboxSize.sm,
                          onChanged: (value) {
                            setState(() {
                              _item1 = value ?? false;
                              _updateSelectAll();
                            });
                          },
                        ),
                        AppTheme.gapVerticalSm,
                        CNCheckbox(
                          value: _item2,
                          label: 'Item 2',
                          size: CheckboxSize.sm,
                          onChanged: (value) {
                            setState(() {
                              _item2 = value ?? false;
                              _updateSelectAll();
                            });
                          },
                        ),
                        AppTheme.gapVerticalSm,
                        CNCheckbox(
                          value: _item3,
                          label: 'Item 3',
                          size: CheckboxSize.sm,
                          onChanged: (value) {
                            setState(() {
                              _item3 = value ?? false;
                              _updateSelectAll();
                            });
                          },
                        ),
                      ],
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

  void _updateSelectAll() {
    if (_item1 && _item2 && _item3) {
      _selectAll = true;
    } else if (!_item1 && !_item2 && !_item3) {
      _selectAll = false;
    } else {
      _selectAll = null;
    }
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
