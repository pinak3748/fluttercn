import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown with label and description.
class DropdownDescriptionPreview extends StatefulWidget {
  const DropdownDescriptionPreview({super.key});

  @override
  State<DropdownDescriptionPreview> createState() =>
      _DropdownDescriptionPreviewState();
}

class _DropdownDescriptionPreviewState
    extends State<DropdownDescriptionPreview> {
  String? _selectedPlan;

  final List<DropdownItem<String>> _plans = const [
    DropdownItem(
      value: 'free',
      label: 'Free',
      description: 'Perfect for personal projects',
    ),
    DropdownItem(
      value: 'pro',
      label: 'Pro',
      description: 'For professional developers',
    ),
    DropdownItem(
      value: 'team',
      label: 'Team',
      description: 'Collaborate with your team',
    ),
    DropdownItem(
      value: 'enterprise',
      label: 'Enterprise',
      description: 'Advanced features for large organizations',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Dropdown<String>(
            label: 'Choose a plan',
            description: 'Select the plan that best fits your needs',
            placeholder: 'Select plan',
            value: _selectedPlan,
            items: _plans,
            onChanged: (value) => setState(() => _selectedPlan = value),
            width: 350,
          ),
        ),
      ),
    );
  }
}
