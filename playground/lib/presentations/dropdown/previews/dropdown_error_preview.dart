import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown error states.
class DropdownErrorPreview extends StatefulWidget {
  const DropdownErrorPreview({super.key});

  @override
  State<DropdownErrorPreview> createState() => _DropdownErrorPreviewState();
}

class _DropdownErrorPreviewState extends State<DropdownErrorPreview> {
  String? _selectedOption;

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
                label: 'Required field',
                placeholder: 'Please select an option',
                value: _selectedOption,
                items: _options,
                onChanged: (value) => setState(() => _selectedOption = value),
                error: _selectedOption == null,
                errorText: _selectedOption == null
                    ? 'This field is required'
                    : null,
                width: 300,
              ),
              AppTheme.gapVertical2xl,
              Text(
                _selectedOption == null
                    ? 'Please select an option to clear the error'
                    : 'Error cleared!',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeSm,
                  color: _selectedOption == null
                      ? AppTheme.error
                      : AppTheme.success,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
