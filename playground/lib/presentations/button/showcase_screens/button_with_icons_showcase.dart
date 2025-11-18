import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonWithIconsShowcase extends StatelessWidget {
  const ButtonWithIconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons with Icons'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Buttons with Icons',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Add icons to enhance button meaning and usability',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              _buildSection(
                'Leading Icons',
                'Icons positioned before the text',
                [
                  Button(
                    onPressed: () => _showMessage(context, 'Mail'),
                    icon: const Icon(Icons.mail),
                    child: const Text('Login with Email'),
                  ),
                  Button(
                    variant: ButtonVariant.secondary,
                    onPressed: () => _showMessage(context, 'Download'),
                    icon: const Icon(Icons.download),
                    child: const Text('Download'),
                  ),
                  Button(
                    variant: ButtonVariant.outline,
                    onPressed: () => _showMessage(context, 'Upload'),
                    icon: const Icon(Icons.upload),
                    child: const Text('Upload'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              _buildSection(
                'Trailing Icons',
                'Icons positioned after the text',
                [
                  Button(
                    onPressed: () => _showMessage(context, 'Continue'),
                    icon: const Icon(Icons.arrow_forward),
                    iconPosition: IconPosition.trailing,
                    child: const Text('Continue'),
                  ),
                  Button(
                    variant: ButtonVariant.secondary,
                    onPressed: () => _showMessage(context, 'Next'),
                    icon: const Icon(Icons.chevron_right),
                    iconPosition: IconPosition.trailing,
                    child: const Text('Next Step'),
                  ),
                  Button(
                    variant: ButtonVariant.ghost,
                    onPressed: () => _showMessage(context, 'External'),
                    icon: const Icon(Icons.open_in_new),
                    iconPosition: IconPosition.trailing,
                    child: const Text('Open Link'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              _buildSection(
                'Icon-only Buttons',
                'Compact buttons with icons only',
                [
                  Button(
                    size: ButtonSize.icon,
                    onPressed: () => _showMessage(context, 'Settings'),
                    child: const Icon(Icons.settings),
                  ),
                  Button(
                    variant: ButtonVariant.secondary,
                    size: ButtonSize.icon,
                    onPressed: () => _showMessage(context, 'Edit'),
                    child: const Icon(Icons.edit),
                  ),
                  Button(
                    variant: ButtonVariant.destructive,
                    size: ButtonSize.icon,
                    onPressed: () => _showMessage(context, 'Delete'),
                    child: const Icon(Icons.delete),
                  ),
                  Button(
                    variant: ButtonVariant.outline,
                    size: ButtonSize.icon,
                    onPressed: () => _showMessage(context, 'More'),
                    child: const Icon(Icons.more_vert),
                  ),
                  Button(
                    variant: ButtonVariant.ghost,
                    size: ButtonSize.icon,
                    onPressed: () => _showMessage(context, 'Search'),
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> buttons) {
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
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: buttons,
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action button pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
