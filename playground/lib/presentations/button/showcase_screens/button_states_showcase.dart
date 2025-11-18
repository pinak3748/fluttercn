import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonStatesShowcase extends StatefulWidget {
  const ButtonStatesShowcase({super.key});

  @override
  State<ButtonStatesShowcase> createState() => _ButtonStatesShowcaseState();
}

class _ButtonStatesShowcaseState extends State<ButtonStatesShowcase> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button States'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button States',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Different button states for various scenarios',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              _buildSection(
                'Loading State',
                'Shows a loading indicator during async operations',
                [
                  Button(
                    onPressed: _toggleLoading,
                    loading: _isLoading,
                    child: Text(_isLoading ? 'Loading...' : 'Click to Load'),
                  ),
                  Button(
                    variant: ButtonVariant.secondary,
                    onPressed: () {},
                    loading: true,
                    child: const Text('Processing'),
                  ),
                  Button(
                    variant: ButtonVariant.outline,
                    onPressed: () {},
                    loading: true,
                    child: const Text('Saving'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              _buildSection(
                'Disabled State',
                'Prevents user interaction when action is unavailable',
                [
                  Button(
                    disabled: true,
                    onPressed: () {},
                    child: const Text('Disabled Primary'),
                  ),
                  Button(
                    variant: ButtonVariant.secondary,
                    disabled: true,
                    onPressed: () {},
                    child: const Text('Disabled Secondary'),
                  ),
                  Button(
                    variant: ButtonVariant.outline,
                    disabled: true,
                    onPressed: () {},
                    child: const Text('Disabled Outline'),
                  ),
                  Button(
                    variant: ButtonVariant.ghost,
                    disabled: true,
                    onPressed: () {},
                    child: const Text('Disabled Ghost'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              _buildSection(
                'Full Width',
                'Buttons that span the full container width',
                [
                  Button(
                    fullWidth: true,
                    onPressed: () => _showMessage('Full width primary'),
                    child: const Text('Full Width Primary'),
                  ),
                  AppTheme.gapVerticalMd,
                  Button(
                    variant: ButtonVariant.secondary,
                    fullWidth: true,
                    onPressed: () => _showMessage('Full width secondary'),
                    child: const Text('Full Width Secondary'),
                  ),
                  AppTheme.gapVerticalMd,
                  Button(
                    variant: ButtonVariant.outline,
                    fullWidth: true,
                    onPressed: () => _showMessage('Full width outline'),
                    child: const Text('Full Width Outline'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              _buildSection(
                'Mixed States',
                'Combining different state properties',
                [
                  Button(
                    fullWidth: true,
                    loading: true,
                    onPressed: () {},
                    icon: const Icon(Icons.cloud_upload),
                    child: const Text('Uploading...'),
                  ),
                  AppTheme.gapVerticalMd,
                  Button(
                    variant: ButtonVariant.destructive,
                    fullWidth: true,
                    disabled: true,
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    child: const Text('Delete (Disabled)'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> content) {
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
            style: AppTheme.titleMedium.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
          AppTheme.gapVerticalXs,
          Text(
            description,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textTertiary,
            ),
          ),
          AppTheme.gapVerticalMd,
          ...content.map((widget) {
            if (widget is Button) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: widget,
              );
            }
            return widget;
          }),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
