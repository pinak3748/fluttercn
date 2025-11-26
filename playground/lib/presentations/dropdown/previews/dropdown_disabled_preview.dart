import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for disabled dropdown states.
class DropdownDisabledPreview extends StatefulWidget {
  const DropdownDisabledPreview({super.key});

  @override
  State<DropdownDisabledPreview> createState() =>
      _DropdownDisabledPreviewState();
}

class _DropdownDisabledPreviewState extends State<DropdownDisabledPreview> {
  final List<DropdownItem<String>> _options = const [
    DropdownItem(value: 'option1', label: 'Option 1'),
    DropdownItem(value: 'option2', label: 'Option 2'),
    DropdownItem(value: 'option3', label: 'Option 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dropdown<String>(
                label: 'Disabled without selection',
                placeholder: 'This is disabled',
                value: null,
                items: _options,
                onChanged: null,
                disabled: true,
                width: 280,
              ),
              AppTheme.gapVertical3xl,
              Dropdown<String>(
                label: 'Disabled with selection',
                placeholder: 'Select option',
                value: 'option2',
                items: _options,
                onChanged: null,
                disabled: true,
                width: 280,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
