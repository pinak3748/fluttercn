import 'package:flutter/material.dart';

import '../widgets/checkbox.dart';
import '../widgets/button.dart';
import '../config/theme.dart';

class CheckboxShowcase extends StatefulWidget {
  const CheckboxShowcase({super.key});

  @override
  State<CheckboxShowcase> createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends State<CheckboxShowcase> {
  bool _basicChecked = false;
  bool _withLabelChecked = true;
  final bool _disabledChecked = true;
  bool _errorChecked = false;
  bool? _tristateValue;
  List<String> _selectedFruits = ['Apple'];
  List<String> _selectedHobbies = [];
  bool _termsAccepted = false;
  bool _newsletterSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic Checkbox',
              'Simple checkbox without label',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: _basicChecked,
                    onChanged: (value) {
                      setState(() {
                        _basicChecked = value ?? false;
                      });
                    },
                  ),
                  AppTheme.gapVerticalSm,
                  Text(
                    'Checked: $_basicChecked',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Checkbox with Label',
              'Checkbox with descriptive label text',
              CNCheckbox(
                value: _withLabelChecked,
                label: 'Accept terms and conditions',
                onChanged: (value) {
                  setState(() {
                    _withLabelChecked = value ?? false;
                  });
                },
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Checkbox with Label and Description',
              'Additional context below the main label',
              CNCheckbox(
                value: _newsletterSubscribed,
                label: 'Subscribe to newsletter',
                description: 'Get updates about new features and releases',
                onChanged: (value) {
                  setState(() {
                    _newsletterSubscribed = value ?? false;
                  });
                },
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Checkbox Sizes',
              'Three sizes: small, medium, and large',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: true,
                    label: 'Small checkbox',
                    size: CheckboxSize.sm,
                    onChanged: (_) {},
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: true,
                    label: 'Medium checkbox',
                    size: CheckboxSize.md,
                    onChanged: (_) {},
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: true,
                    label: 'Large checkbox',
                    size: CheckboxSize.lg,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Disabled State',
              'Checkboxes that cannot be interacted with',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: false,
                    label: 'Disabled unchecked',
                    disabled: true,
                    onChanged: (_) {},
                  ),
                  AppTheme.gapVerticalMd,
                  CNCheckbox(
                    value: _disabledChecked,
                    label: 'Disabled checked',
                    disabled: true,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Error State',
              'Checkboxes with error styling and messages',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: _errorChecked,
                    label: 'I agree to the terms',
                    error: !_errorChecked,
                    errorText: _errorChecked ? null : 'You must accept the terms',
                    onChanged: (value) {
                      setState(() {
                        _errorChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Indeterminate State',
              'Three-state checkbox (checked, unchecked, indeterminate)',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNCheckbox(
                    value: _tristateValue,
                    label: 'Select all items',
                    tristate: true,
                    onChanged: (value) {
                      setState(() {
                        _tristateValue = value;
                      });
                    },
                  ),
                  AppTheme.gapVerticalSm,
                  Text(
                    'State: ${_tristateValue == null ? "Indeterminate" : _tristateValue! ? "Checked" : "Unchecked"}',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textTertiary,
                    ),
                  ),
                  AppTheme.gapVerticalSm,
                  Text(
                    'Click to cycle through: Unchecked → Checked → Indeterminate',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textTertiary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Checkbox Group (Vertical)',
              'Multiple checkboxes arranged vertically',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxGroup(
                    options: const ['Apple', 'Banana', 'Orange', 'Mango'],
                    selectedValues: _selectedFruits,
                    onChanged: (values) {
                      setState(() {
                        _selectedFruits = values;
                      });
                    },
                  ),
                  AppTheme.gapVerticalMd,
                  Text(
                    'Selected: ${_selectedFruits.isEmpty ? "None" : _selectedFruits.join(", ")}',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Checkbox Group (Horizontal)',
              'Multiple checkboxes arranged horizontally',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxGroup(
                    options: const ['Reading', 'Gaming', 'Sports', 'Music', 'Cooking'],
                    selectedValues: _selectedHobbies,
                    direction: Axis.horizontal,
                    size: CheckboxSize.sm,
                    onChanged: (values) {
                      setState(() {
                        _selectedHobbies = values;
                      });
                    },
                  ),
                  AppTheme.gapVerticalMd,
                  Text(
                    'Selected: ${_selectedHobbies.isEmpty ? "None" : _selectedHobbies.join(", ")}',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Real-world Examples',
              'Common checkbox use cases in applications',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExample(
                    'Sign Up Form',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account',
                          style: AppTheme.titleLarge.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                        AppTheme.gapVerticalLg,
                        CNCheckbox(
                          value: _termsAccepted,
                          label: 'I agree to the Terms of Service and Privacy Policy',
                          size: CheckboxSize.sm,
                          onChanged: (value) {
                            setState(() {
                              _termsAccepted = value ?? false;
                            });
                          },
                        ),
                        AppTheme.gapVerticalMd,
                        CNCheckbox(
                          value: _newsletterSubscribed,
                          label: 'Send me promotional emails',
                          description: 'You can unsubscribe at any time',
                          size: CheckboxSize.sm,
                          onChanged: (value) {
                            setState(() {
                              _newsletterSubscribed = value ?? false;
                            });
                          },
                        ),
                        AppTheme.gapVerticalLg,
                        Button(
                          onPressed: _termsAccepted ? () => _showSnackBar('Account created!') : null,
                          disabled: !_termsAccepted,
                          child: const Text('Create Account'),
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Settings Panel',
                    _SettingsPanel(
                      onChanged: () => setState(() {}),
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Task List',
                    _TaskList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.headlineSmall.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
        AppTheme.gapVerticalSm,
        Text(
          description,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
        AppTheme.gapVerticalLg,
        content,
      ],
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}

class _SettingsPanel extends StatefulWidget {
  const _SettingsPanel({required this.onChanged});

  final VoidCallback onChanged;

  @override
  State<_SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<_SettingsPanel> {
  bool _notifications = true;
  bool _emailNotifications = false;
  bool _pushNotifications = true;
  bool _darkMode = false;
  bool _autoSave = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences',
          style: AppTheme.titleMedium.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
        AppTheme.gapVerticalMd,
        CNCheckbox(
          value: _notifications,
          label: 'Enable notifications',
          size: CheckboxSize.sm,
          onChanged: (value) {
            setState(() {
              _notifications = value ?? false;
              if (!_notifications) {
                _emailNotifications = false;
                _pushNotifications = false;
              }
            });
            widget.onChanged();
          },
        ),
        if (_notifications) ...[
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTheme.gapVerticalSm,
                CNCheckbox(
                  value: _emailNotifications,
                  label: 'Email notifications',
                  size: CheckboxSize.sm,
                  onChanged: (value) {
                    setState(() {
                      _emailNotifications = value ?? false;
                    });
                    widget.onChanged();
                  },
                ),
                AppTheme.gapVerticalSm,
                CNCheckbox(
                  value: _pushNotifications,
                  label: 'Push notifications',
                  size: CheckboxSize.sm,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value ?? false;
                    });
                    widget.onChanged();
                  },
                ),
              ],
            ),
          ),
        ],
        AppTheme.gapVerticalMd,
        CNCheckbox(
          value: _darkMode,
          label: 'Dark mode',
          description: 'Use dark theme across the app',
          size: CheckboxSize.sm,
          onChanged: (value) {
            setState(() {
              _darkMode = value ?? false;
            });
            widget.onChanged();
          },
        ),
        AppTheme.gapVerticalMd,
        CNCheckbox(
          value: _autoSave,
          label: 'Auto-save',
          description: 'Automatically save changes',
          size: CheckboxSize.sm,
          onChanged: (value) {
            setState(() {
              _autoSave = value ?? false;
            });
            widget.onChanged();
          },
        ),
      ],
    );
  }
}

class _TaskList extends StatefulWidget {
  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Complete project documentation', 'done': true},
    {'title': 'Review pull requests', 'done': false},
    {'title': 'Update dependencies', 'done': false},
    {'title': 'Fix critical bugs', 'done': true},
  ];

  @override
  Widget build(BuildContext context) {
    final completedCount = _tasks.where((task) => task['done'] == true).length;
    final totalCount = _tasks.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tasks',
              style: AppTheme.titleMedium.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightSemiBold,
              ),
            ),
            Text(
              '$completedCount / $totalCount completed',
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
          ],
        ),
        AppTheme.gapVerticalMd,
        ..._tasks.asMap().entries.map((entry) {
          final index = entry.key;
          final task = entry.value;
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < _tasks.length - 1 ? 8 : 0,
            ),
            child: CNCheckbox(
              value: task['done'],
              label: task['title'],
              size: CheckboxSize.sm,
              onChanged: (value) {
                setState(() {
                  _tasks[index]['done'] = value ?? false;
                });
              },
            ),
          );
        }),
      ],
    );
  }
}
