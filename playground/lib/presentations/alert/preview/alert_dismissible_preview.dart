import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/alert.dart';

/// Preview for dismissible alerts.
class AlertDismissiblePreview extends StatefulWidget {
  const AlertDismissiblePreview({super.key});

  @override
  State<AlertDismissiblePreview> createState() =>
      _AlertDismissiblePreviewState();
}

class _AlertDismissiblePreviewState extends State<AlertDismissiblePreview> {
  final List<bool> _dismissed = [false, false, false, false];

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
                'Click the X to dismiss each alert',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
              ),
              AppTheme.gapVertical2xl,
              if (!_dismissed[0])
                Alert(
                  variant: AlertVariant.info,
                  title: 'Welcome!',
                  description:
                      'Thanks for signing up. Click the X to dismiss this message.',
                  dismissible: true,
                  onDismiss: () => setState(() => _dismissed[0] = true),
                ),
              if (!_dismissed[0]) AppTheme.gapVertical2xl,
              if (!_dismissed[1])
                Alert(
                  variant: AlertVariant.success,
                  title: 'Profile Updated',
                  description: 'Your profile changes have been saved.',
                  dismissible: true,
                  onDismiss: () => setState(() => _dismissed[1] = true),
                ),
              if (!_dismissed[1]) AppTheme.gapVertical2xl,
              if (!_dismissed[2])
                Alert(
                  variant: AlertVariant.warning,
                  title: 'Storage Almost Full',
                  description: 'You have used 90% of your storage quota.',
                  dismissible: true,
                  onDismiss: () => setState(() => _dismissed[2] = true),
                ),
              if (!_dismissed[2]) AppTheme.gapVertical2xl,
              if (!_dismissed[3])
                Alert(
                  variant: AlertVariant.error,
                  title: 'Sync Failed',
                  description:
                      'Unable to sync your data. Will retry in 5 minutes.',
                  dismissible: true,
                  onDismiss: () => setState(() => _dismissed[3] = true),
                ),
              if (_dismissed.every((d) => d)) ...[
                AppTheme.gapVertical2xl,
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 48,
                        color: AppTheme.success,
                      ),
                      AppTheme.gapVerticalMd,
                      Text(
                        'All alerts dismissed!',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeLg,
                          fontWeight: AppTheme.fontWeightSemiBold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      AppTheme.gapVerticalSm,
                      Text(
                        'Tap "Reset All" to restore them.',
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeMd,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
