import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for a basic dropdown without labels.
class DropdownBasicPreview extends StatefulWidget {
  const DropdownBasicPreview({super.key});

  @override
  State<DropdownBasicPreview> createState() => _DropdownBasicPreviewState();
}

class _DropdownBasicPreviewState extends State<DropdownBasicPreview> {
  String? _selectedFruit;

  final List<DropdownItem<String>> _fruits = const [
    DropdownItem(value: 'apple', label: 'Apple'),
    DropdownItem(value: 'banana', label: 'Banana'),
    DropdownItem(value: 'orange', label: 'Orange'),
    DropdownItem(value: 'mango', label: 'Mango'),
    DropdownItem(value: 'strawberry', label: 'Strawberry'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Dropdown<String>(
            placeholder: 'Select a fruit',
            value: _selectedFruit,
            items: _fruits,
            onChanged: (value) => setState(() => _selectedFruit = value),
            width: 250,
          ),
        ),
      ),
    );
  }
}
