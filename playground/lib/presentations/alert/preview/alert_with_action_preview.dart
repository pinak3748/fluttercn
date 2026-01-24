import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/alert.dart';

/// Preview for alerts with action buttons.
class AlertWithActionPreview extends StatelessWidget {
  const AlertWithActionPreview({super.key});

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
              Alert(
                variant: AlertVariant.info,
                title: 'Update Available',
                description: 'A new version (2.0.0) is available for download.',
                action: Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Later')),
                    SizedBox(width: AppTheme.spaceSm),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Update Now'),
                    ),
                  ],
                ),
              ),
              AppTheme.gapVertical2xl,
              Alert(
                variant: AlertVariant.warning,
                title: 'Session Expiring',
                description: 'Your session will expire in 5 minutes.',
                action: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Extend Session',
                    style: TextStyle(
                      color: AppTheme.warning,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                ),
              ),
              AppTheme.gapVertical2xl,
              Alert(
                variant: AlertVariant.error,
                title: 'Payment Failed',
                description:
                    'We could not process your payment. Please update your payment method.',
                action: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.error,
                    side: BorderSide(color: AppTheme.error),
                  ),
                  child: const Text('Update Payment'),
                ),
              ),
              AppTheme.gapVertical2xl,
              Alert(
                variant: AlertVariant.success,
                title: 'Order Confirmed',
                description: 'Your order #12345 has been placed successfully.',
                action: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: AppTheme.success,
                  ),
                  label: Text(
                    'Track Order',
                    style: TextStyle(color: AppTheme.success),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
