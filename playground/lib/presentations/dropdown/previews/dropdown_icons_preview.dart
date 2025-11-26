import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown with icons.
class DropdownIconsPreview extends StatefulWidget {
  const DropdownIconsPreview({super.key});

  @override
  State<DropdownIconsPreview> createState() => _DropdownIconsPreviewState();
}

class _DropdownIconsPreviewState extends State<DropdownIconsPreview> {
  String? _selectedTheme;
  String? _selectedStatus;

  final List<DropdownItem<String>> _themes = const [
    DropdownItem(value: 'light', label: 'Light', icon: Icons.light_mode),
    DropdownItem(value: 'dark', label: 'Dark', icon: Icons.dark_mode),
    DropdownItem(value: 'auto', label: 'Auto', icon: Icons.brightness_auto),
  ];

  final List<DropdownItem<String>> _statuses = const [
    DropdownItem(
      value: 'online',
      label: 'Online',
      icon: Icons.circle,
      description: 'Available to chat',
    ),
    DropdownItem(
      value: 'busy',
      label: 'Busy',
      icon: Icons.do_not_disturb,
      description: 'Do not disturb',
    ),
    DropdownItem(
      value: 'offline',
      label: 'Offline',
      icon: Icons.power_settings_new,
      description: 'Appear offline',
    ),
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
                label: 'Theme preference',
                placeholder: 'Select theme',
                value: _selectedTheme,
                items: _themes,
                onChanged: (value) => setState(() => _selectedTheme = value),
                width: 280,
              ),
              AppTheme.gapVertical3xl,
              Dropdown<String>(
                label: 'Your status',
                description: 'Let others know your availability',
                placeholder: 'Set status',
                value: _selectedStatus,
                items: _statuses,
                onChanged: (value) => setState(() => _selectedStatus = value),
                width: 280,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
