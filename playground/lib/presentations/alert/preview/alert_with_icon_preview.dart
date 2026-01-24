import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/alert.dart';

/// Preview for alerts with custom icons.
class AlertWithIconPreview extends StatelessWidget {
  const AlertWithIconPreview({super.key});

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
                'Default icons per variant',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.info,
                title: 'New Update Available',
                description: 'A new version of the app is ready to install.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.success,
                title: 'Payment Confirmed',
                description: 'Your payment has been processed successfully.',
              ),
              AppTheme.gapVertical2xl,
              Text(
                'Custom icons',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.info,
                icon: Icons.rocket_launch_outlined,
                title: 'New Feature',
                description: 'Check out our latest feature release!',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.success,
                icon: Icons.cloud_done_outlined,
                title: 'Backup Complete',
                description: 'All your files have been backed up to the cloud.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.warning,
                icon: Icons.battery_alert_outlined,
                title: 'Low Battery',
                description:
                    'Your device battery is running low. Connect charger.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                variant: AlertVariant.error,
                icon: Icons.wifi_off_outlined,
                title: 'Connection Lost',
                description:
                    'Unable to connect to the server. Check your internet.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
