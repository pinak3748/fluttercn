import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/alert.dart';

/// Preview for alert variants.
class AlertVariantsPreview extends StatelessWidget {
  const AlertVariantsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Default',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              const Alert(
                variant: AlertVariant.default_,
                title: 'Default Alert',
                description: 'This is a default styled alert message.',
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Info',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              const Alert(
                variant: AlertVariant.info,
                title: 'Information',
                description:
                    'This alert provides helpful information to the user.',
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Success',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              const Alert(
                variant: AlertVariant.success,
                title: 'Success!',
                description: 'Your changes have been saved successfully.',
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Warning',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              const Alert(
                variant: AlertVariant.warning,
                title: 'Warning',
                description:
                    'Your session is about to expire. Please save your work.',
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Error',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              const Alert(
                variant: AlertVariant.error,
                title: 'Error',
                description:
                    'There was an error processing your request. Please try again.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
