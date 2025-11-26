import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown sizes.
class DropdownSizesPreview extends StatefulWidget {
  const DropdownSizesPreview({super.key});

  @override
  State<DropdownSizesPreview> createState() => _DropdownSizesPreviewState();
}

class _DropdownSizesPreviewState extends State<DropdownSizesPreview> {
  String? _selectedSmall;
  String? _selectedMedium;
  String? _selectedLarge;

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
                label: 'Small',
                placeholder: 'Select option',
                value: _selectedSmall,
                items: _options,
                onChanged: (value) => setState(() => _selectedSmall = value),
                size: DropdownSize.sm,
                width: 250,
              ),
              AppTheme.gapVertical3xl,
              Dropdown<String>(
                label: 'Medium',
                placeholder: 'Select option',
                value: _selectedMedium,
                items: _options,
                onChanged: (value) => setState(() => _selectedMedium = value),
                size: DropdownSize.md,
                width: 250,
              ),
              AppTheme.gapVertical3xl,
              Dropdown<String>(
                label: 'Large',
                placeholder: 'Select option',
                value: _selectedLarge,
                items: _options,
                onChanged: (value) => setState(() => _selectedLarge = value),
                size: DropdownSize.lg,
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
