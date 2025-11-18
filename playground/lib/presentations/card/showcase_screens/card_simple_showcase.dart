import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class CardSimpleShowcase extends StatelessWidget {
  const CardSimpleShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Cards'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Simple Card Usage',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Backward-compatible single child approach',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            CNCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Card',
                    style: AppTheme.titleLarge.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalSm,
                  Text(
                    'This is a simple card with a single child. It uses default padding and styling.',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: AppTheme.borderRadiusMd,
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: AppTheme.white,
                        ),
                      ),
                      AppTheme.gapHorizontalMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Notification',
                              style: AppTheme.titleMedium.copyWith(
                                color: AppTheme.textPrimary,
                                fontWeight: AppTheme.fontWeightSemiBold,
                              ),
                            ),
                            AppTheme.gapVerticalXs,
                            Text(
                              'You have a new message',
                              style: AppTheme.bodySmall.copyWith(
                                color: AppTheme.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card with Action',
                    style: AppTheme.titleLarge.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalSm,
                  Text(
                    'This card includes a button for user interaction.',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  Button(
                    size: ButtonSize.sm,
                    onPressed: () => _showMessage(context, 'Action'),
                    child: const Text('Take Action'),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceVariant,
                      borderRadius: AppTheme.borderRadiusMd,
                    ),
                    child: Icon(
                      Icons.image,
                      size: 32,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                  AppTheme.gapHorizontalLg,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Media Card',
                          style: AppTheme.titleMedium.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                        AppTheme.gapVerticalXs,
                        Text(
                          'Cards can include images, icons, and other media elements.',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stats Card',
                    style: AppTheme.labelMedium.copyWith(
                      color: AppTheme.textTertiary,
                      fontWeight: AppTheme.fontWeightMedium,
                    ),
                  ),
                  AppTheme.gapVerticalMd,
                  Text(
                    '1,234',
                    style: AppTheme.displayMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightBold,
                    ),
                  ),
                  AppTheme.gapVerticalXs,
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        size: 16,
                        color: AppTheme.success,
                      ),
                      AppTheme.gapHorizontalXs,
                      Text(
                        '+12.5% from last month',
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.success,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
