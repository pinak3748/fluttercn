import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown with a label.
class DropdownLabelPreview extends StatefulWidget {
  const DropdownLabelPreview({super.key});

  @override
  State<DropdownLabelPreview> createState() => _DropdownLabelPreviewState();
}

class _DropdownLabelPreviewState extends State<DropdownLabelPreview> {
  String? _selectedCountry;

  final List<DropdownItem<String>> _countries = const [
    DropdownItem(value: 'us', label: 'United States'),
    DropdownItem(value: 'uk', label: 'United Kingdom'),
    DropdownItem(value: 'ca', label: 'Canada'),
    DropdownItem(value: 'au', label: 'Australia'),
    DropdownItem(value: 'in', label: 'India'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Dropdown<String>(
            label: 'Select your country',
            placeholder: 'Choose a country',
            value: _selectedCountry,
            items: _countries,
            onChanged: (value) => setState(() => _selectedCountry = value),
            width: 300,
          ),
        ),
      ),
    );
  }
}
