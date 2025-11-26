import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview widget showing bottom sheet with a form
class BottomSheetFormPreview extends StatefulWidget {
  const BottomSheetFormPreview({super.key});

  @override
  State<BottomSheetFormPreview> createState() => _BottomSheetFormPreviewState();
}

class _BottomSheetFormPreviewState extends State<BottomSheetFormPreview> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedRole;
  bool _nameError = false;
  bool _emailError = false;
  String? _emailErrorText;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _showFormSheet() {
    // Reset errors when opening
    setState(() {
      _nameError = false;
      _emailError = false;
      _emailErrorText = null;
    });

    showAppBottomSheet(
      context: context,
      size: BottomSheetSize.lg,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) => Column(
        children: [
          BottomSheetHeader(
            title: BottomSheetTitle('Create New User'),
            description: BottomSheetDescription(
              'Fill in the details to create a new user account',
            ),
            showCloseButton: true,
          ),
          Expanded(
            child: BottomSheetContent(
              scrollable: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cn.TextField(
                    controller: _nameController,
                    label: 'Full Name',
                    placeholder: 'Enter your full name',
                    prefixIcon: Icons.person,
                    error: _nameError,
                    errorText: _nameError ? 'Please enter your name' : null,
                    onChanged: (_) {
                      if (_nameError) {
                        setState(() => _nameError = false);
                      }
                    },
                  ),
                  AppTheme.gapLg,
                  cn.TextField(
                    controller: _emailController,
                    label: 'Email Address',
                    placeholder: 'Enter your email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    error: _emailError,
                    errorText: _emailErrorText,
                    onChanged: (_) {
                      if (_emailError) {
                        setState(() {
                          _emailError = false;
                          _emailErrorText = null;
                        });
                      }
                    },
                  ),
                  AppTheme.gapLg,
                  Dropdown<String>(
                    label: 'Role',
                    placeholder: 'Select a role',
                    value: _selectedRole,
                    items: const [
                      DropdownItem(
                        value: 'admin',
                        label: 'Administrator',
                        icon: Icons.admin_panel_settings,
                        description: 'Full access to all features',
                      ),
                      DropdownItem(
                        value: 'editor',
                        label: 'Editor',
                        icon: Icons.edit,
                        description: 'Can create and edit content',
                      ),
                      DropdownItem(
                        value: 'viewer',
                        label: 'Viewer',
                        icon: Icons.visibility,
                        description: 'Read-only access',
                      ),
                    ],
                    onChanged: (value) {
                      _selectedRole = value;
                    },
                  ),
                  AppTheme.gapLg,
                  Container(
                    padding: AppTheme.paddingMd,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: AppTheme.textSecondary,
                        ),
                        AppTheme.gapHorizontalSm,
                        Expanded(
                          child: Text(
                            'An invitation email will be sent to the provided email address.',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomSheetFooter(
            child: Row(
              children: [
                Expanded(
                  child: Button(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _nameController.clear();
                      _emailController.clear();
                      _selectedRole = null;
                    },
                    variant: ButtonVariant.outline,
                    child: const Text('Cancel'),
                  ),
                ),
                AppTheme.gapHorizontalMd,
                Expanded(
                  child: Button(
                    onPressed: () {
                      // Validate form
                      bool hasErrors = false;

                      if (_nameController.text.isEmpty) {
                        setState(() => _nameError = true);
                        hasErrors = true;
                      }

                      if (_emailController.text.isEmpty) {
                        setState(() {
                          _emailError = true;
                          _emailErrorText = 'Please enter your email';
                        });
                        hasErrors = true;
                      } else if (!_emailController.text.contains('@')) {
                        setState(() {
                          _emailError = true;
                          _emailErrorText = 'Please enter a valid email';
                        });
                        hasErrors = true;
                      }

                      if (_selectedRole == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Please select a role'),
                            backgroundColor: AppTheme.error,
                          ),
                        );
                        hasErrors = true;
                      }

                      if (!hasErrors) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'User created: ${_nameController.text}',
                            ),
                            backgroundColor: AppTheme.success,
                          ),
                        );
                        _nameController.clear();
                        _emailController.clear();
                        _selectedRole = null;
                      }
                    },
                    child: const Text('Create User'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
              Text(
                'Form Example',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapMd,
              Text(
                'This demonstrates a complete form inside a bottom sheet with validation and actions.',
                style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
                textAlign: TextAlign.center,
              ),
              AppTheme.gap3xl,
              Button(
                onPressed: _showFormSheet,
                child: const Text('Open Form Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
